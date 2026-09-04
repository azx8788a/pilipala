import 'package:pilipala/utils/storage.dart';

/// 设置项搜索条目
class SettingEntry {
  /// 功能名称（参与搜索匹配）
  final String title;

  /// 功能描述（参与搜索匹配）
  final String? subtitle;

  /// 所属设置分组
  final String group;

  /// 跳转路由；有回调副作用或弹窗逻辑的项只做跳转
  final String? route;

  /// 设置键；非空且无回调副作用时，可直接在搜索页以开关形式操作
  final String? setKey;

  /// 开关默认值
  final bool defaultVal;

  const SettingEntry({
    required this.title,
    this.subtitle,
    required this.group,
    this.route,
    this.setKey,
    this.defaultVal = false,
  });

  /// 模糊匹配：标题或描述包含关键字（不区分大小写）
  bool match(String keyword) {
    if (keyword.isEmpty) return true;
    final kw = keyword.toLowerCase();
    return title.toLowerCase().contains(kw) ||
        (subtitle?.toLowerCase().contains(kw) ?? false);
  }
}

/// 全部可搜索设置项清单
const List<SettingEntry> settingEntries = [
  // ===== 播放设置 =====
  SettingEntry(
      title: '倍速设置',
      subtitle: '设置视频播放速度',
      group: '播放设置',
      route: '/playSpeedSet'),
  SettingEntry(
      title: '手势设置',
      subtitle: '设置播放器手势',
      group: '播放设置',
      route: '/playerGestureSet'),
  SettingEntry(
      title: '开启1080P',
      subtitle: '免登录查看1080P视频',
      group: '播放设置',
      setKey: SettingBoxKey.p1080,
      defaultVal: true),
  SettingEntry(
      title: 'CDN优化',
      subtitle: '使用优质CDN线路',
      group: '播放设置',
      setKey: SettingBoxKey.enableCDN,
      defaultVal: true),
  SettingEntry(
      title: '自动播放',
      subtitle: '进入详情页自动播放',
      group: '播放设置',
      setKey: SettingBoxKey.autoPlayEnable,
      defaultVal: true),
  SettingEntry(
      title: '后台播放',
      subtitle: '进入后台时继续播放',
      group: '播放设置',
      setKey: SettingBoxKey.enableBackgroundPlay),
  SettingEntry(
      title: '自动PiP播放',
      subtitle: '进入后台时画中画播放',
      group: '播放设置',
      setKey: SettingBoxKey.autoPiP),
  SettingEntry(
      title: '自动全屏',
      subtitle: '视频开始播放时进入全屏',
      group: '播放设置',
      setKey: SettingBoxKey.enableAutoEnter),
  SettingEntry(
      title: '自动退出',
      subtitle: '视频结束播放时退出全屏',
      group: '播放设置',
      setKey: SettingBoxKey.enableAutoExit),
  SettingEntry(
      title: '开启硬解',
      subtitle: '以较低功耗播放视频',
      group: '播放设置',
      setKey: SettingBoxKey.enableHA),
  SettingEntry(
      title: '观看人数',
      subtitle: '展示同时在看人数',
      group: '播放设置',
      setKey: SettingBoxKey.enableOnlineTotal),
  SettingEntry(
      title: '亮度记忆',
      subtitle: '返回时自动调整视频亮度',
      group: '播放设置',
      setKey: SettingBoxKey.enableAutoBrightness),
  SettingEntry(
      title: '弹幕开关',
      subtitle: '展示弹幕',
      group: '播放设置',
      setKey: SettingBoxKey.enableShowDanmaku),
  SettingEntry(
      title: '空降助手',
      subtitle: '自动跳过赞助商广告、片头片尾等片段',
      group: '播放设置',
      setKey: SettingBoxKey.enableSponsorBlock),
  SettingEntry(
      title: '跳过恰饭广告',
      subtitle: '跳过赞助商推广片段',
      group: '播放设置',
      setKey: SettingBoxKey.sbSkipSponsor,
      defaultVal: true),
  SettingEntry(
      title: '跳过片头',
      subtitle: '跳过开场动画、无意义片头',
      group: '播放设置',
      setKey: SettingBoxKey.sbSkipIntro,
      defaultVal: true),
  SettingEntry(
      title: '跳过片尾',
      subtitle: '跳过片尾致谢、结尾动画',
      group: '播放设置',
      setKey: SettingBoxKey.sbSkipOutro),
  SettingEntry(
      title: '跳过互动提醒',
      subtitle: '跳过求三连、求关注等提醒',
      group: '播放设置',
      setKey: SettingBoxKey.sbSkipInteraction),
  SettingEntry(
      title: '跳过自我推广',
      subtitle: '跳过UP主推广自己的周边等',
      group: '播放设置',
      setKey: SettingBoxKey.sbSkipSelfPromo),
  SettingEntry(
      title: '控制栏动画',
      subtitle: '播放器控制栏显示动画效果',
      group: '播放设置',
      route: '/playSetting'),
  SettingEntry(
      title: '港澳台模式',
      subtitle: '使用港澳台番剧线路',
      group: '播放设置',
      route: '/playSetting'),
  SettingEntry(
      title: '默认视频画质',
      subtitle: '设置视频默认画质',
      group: '播放设置',
      route: '/playSetting'),
  SettingEntry(
      title: '默认直播画质',
      subtitle: '设置直播默认画质',
      group: '播放设置',
      route: '/playSetting'),
  SettingEntry(
      title: '默认音质',
      subtitle: '设置默认音质',
      group: '播放设置',
      route: '/playSetting'),
  SettingEntry(
      title: '默认解码格式',
      subtitle: '设置默认解码格式',
      group: '播放设置',
      route: '/playSetting'),
  SettingEntry(
      title: '音频输出方式',
      subtitle: '设置音频输出方式',
      group: '播放设置',
      route: '/playSetting'),
  SettingEntry(
      title: '默认全屏方式',
      subtitle: '设置全屏时的方向',
      group: '播放设置',
      route: '/playSetting'),
  SettingEntry(
      title: '底部进度条展示',
      subtitle: '设置底部进度条展示方式',
      group: '播放设置',
      route: '/playSetting'),

  // ===== 外观设置 =====
  SettingEntry(
      title: '震动反馈',
      subtitle: '请确定手机设置中已开启震动反馈',
      group: '外观设置',
      route: '/styleSetting'),
  SettingEntry(
      title: 'MD3样式底栏',
      subtitle: '符合Material You设计规范的底栏',
      group: '外观设置',
      setKey: SettingBoxKey.enableMYBar,
      defaultVal: true),
  SettingEntry(
      title: '首页顶栏收起',
      subtitle: '首页列表滑动时，收起顶栏',
      group: '外观设置',
      setKey: SettingBoxKey.hideSearchBar,
      defaultVal: true),
  SettingEntry(
      title: '首页底栏收起',
      subtitle: '首页列表滑动时，收起底栏',
      group: '外观设置',
      setKey: SettingBoxKey.hideTabBar,
      defaultVal: true),
  SettingEntry(
      title: '首页顶部背景渐变',
      subtitle: '首页顶部背景渐变效果',
      group: '外观设置',
      setKey: SettingBoxKey.enableGradientBg,
      defaultVal: true),
  SettingEntry(
      title: '自定义列数',
      subtitle: '自定义首页展示列数',
      group: '外观设置',
      route: '/styleSetting'),
  SettingEntry(
      title: '图片质量',
      subtitle: '选择合适的图片清晰度，上限100%',
      group: '外观设置',
      route: '/styleSetting'),
  SettingEntry(
      title: 'Toast不透明度',
      subtitle: '自定义Toast不透明度',
      group: '外观设置',
      route: '/styleSetting'),
  SettingEntry(
      title: '主题模式',
      subtitle: '亮色/暗色/跟随系统',
      group: '外观设置',
      route: '/styleSetting'),
  SettingEntry(
      title: '动态未读标记',
      subtitle: '设置动态未读标记样式',
      group: '外观设置',
      route: '/styleSetting'),
  SettingEntry(
      title: '应用主题',
      subtitle: '动态取色或指定颜色',
      group: '外观设置',
      route: '/colorSetting'),
  SettingEntry(
      title: '默认启动页',
      subtitle: '设置启动后进入的页面',
      group: '外观设置',
      route: '/styleSetting'),
  SettingEntry(
      title: '字体大小',
      subtitle: '调整全局字体大小',
      group: '外观设置',
      route: '/fontSizeSetting'),
  SettingEntry(
      title: '首页tabbar',
      subtitle: '编辑首页顶部tab',
      group: '外观设置',
      route: '/tabbarSetting'),
  SettingEntry(
      title: '底部导航栏设置',
      subtitle: '编辑底部导航栏',
      group: '外观设置',
      route: '/navbarSetting'),
  SettingEntry(
      title: '屏幕帧率',
      subtitle: '设置屏幕刷新率',
      group: '外观设置',
      route: '/displayModeSetting'),

  // ===== 推荐设置 =====
  SettingEntry(
      title: '首页推荐类型',
      subtitle: '选择首页推荐使用的接口端',
      group: '推荐设置',
      route: '/recommendSetting'),
  SettingEntry(
      title: '推荐动态',
      subtitle: '是否在推荐内容中展示动态',
      group: '推荐设置',
      setKey: SettingBoxKey.enableRcmdDynamic,
      defaultVal: true),
  SettingEntry(
      title: '首页推荐刷新',
      subtitle: '下拉刷新时保留上次内容',
      group: '推荐设置',
      setKey: SettingBoxKey.enableSaveLastData),
  SettingEntry(
      title: '点赞率过滤',
      subtitle: '过滤低点赞率推荐视频',
      group: '推荐设置',
      route: '/recommendSetting'),
  SettingEntry(
      title: '视频时长过滤',
      subtitle: '过滤短时长推荐视频',
      group: '推荐设置',
      route: '/recommendSetting'),
  SettingEntry(
      title: '已关注Up豁免推荐过滤',
      subtitle: '推荐中已关注用户发布的内容不会被过滤',
      group: '推荐设置',
      route: '/recommendSetting'),
  SettingEntry(
      title: '过滤器也应用于相关视频',
      subtitle: '视频详情页的相关视频也进行过滤',
      group: '推荐设置',
      route: '/recommendSetting'),

  // ===== 隐私设置 =====
  SettingEntry(
      title: '黑名单管理',
      subtitle: '已拉黑用户',
      group: '隐私设置',
      route: '/blackListPage'),
  SettingEntry(
      title: '刷新access_key',
      subtitle: '刷新登录凭证',
      group: '隐私设置',
      route: '/privacySetting'),

  // ===== 其他设置 =====
  SettingEntry(
      title: '大家都在搜',
      subtitle: '是否展示「大家都在搜」',
      group: '其他设置',
      setKey: SettingBoxKey.enableHotKey,
      defaultVal: true),
  SettingEntry(
      title: '搜索默认词',
      subtitle: '是否展示搜索框默认词',
      group: '其他设置',
      route: '/extraSetting'),
  SettingEntry(
      title: '快速收藏',
      subtitle: '点按收藏至默认，长按选择文件夹',
      group: '其他设置',
      setKey: SettingBoxKey.enableQuickFav),
  SettingEntry(
      title: '评论区搜索关键词',
      subtitle: '展示评论区搜索关键词',
      group: '其他设置',
      setKey: SettingBoxKey.enableWordRe),
  SettingEntry(
      title: '启用ai总结',
      subtitle: '视频详情页开启ai总结',
      group: '其他设置',
      setKey: SettingBoxKey.enableAi,
      defaultVal: true),
  SettingEntry(
      title: '相关视频推荐',
      subtitle: '视频详情页推荐相关视频',
      group: '其他设置',
      setKey: SettingBoxKey.enableRelatedVideo,
      defaultVal: true),
  SettingEntry(
      title: '评论展示',
      subtitle: '设置评论默认排序',
      group: '其他设置',
      route: '/extraSetting'),
  SettingEntry(
      title: '动态展示',
      subtitle: '设置动态默认展示类型',
      group: '其他设置',
      route: '/extraSetting'),
  SettingEntry(
      title: '设置代理',
      subtitle: '设置代理 host:port',
      group: '其他设置',
      route: '/extraSetting'),
  SettingEntry(
      title: '检查更新',
      subtitle: '每次启动时检查是否需要更新',
      group: '其他设置',
      route: '/extraSetting'),
];