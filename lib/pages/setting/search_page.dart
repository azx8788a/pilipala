import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilipala/pages/setting/setting_search_data.dart';
import 'package:pilipala/pages/setting/widgets/switch_item.dart';

/// 设置搜索页：模糊搜索全部设置项
class SettingSearchPage extends StatefulWidget {
  const SettingSearchPage({super.key});

  @override
  State<SettingSearchPage> createState() => _SettingSearchPageState();
}

class _SettingSearchPageState extends State<SettingSearchPage> {
  final TextEditingController _controller = TextEditingController();
  String _keyword = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.titleMedium!;
    TextStyle subTitleStyle = Theme.of(context)
        .textTheme
        .labelMedium!
        .copyWith(color: Theme.of(context).colorScheme.outline);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          '搜索设置',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            child: TextField(
              controller: _controller,
              autofocus: true,
              onChanged: (val) => setState(() => _keyword = val.trim()),
              decoration: InputDecoration(
                hintText: '搜索设置项，如：弹幕',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _keyword.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() => _keyword = '');
                        },
                      ),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
            ),
          ),
          Expanded(child: _buildResultList(titleStyle, subTitleStyle)),
        ],
      ),
    );
  }

  Widget _buildResultList(TextStyle titleStyle, TextStyle subTitleStyle) {
    final List<SettingEntry> results =
        settingEntries.where((e) => e.match(_keyword)).toList();
    if (results.isEmpty) {
      return Center(
        child: Text(
          _keyword.isEmpty ? '输入关键词搜索全部设置项' : '未找到相关设置',
          style: subTitleStyle,
        ),
      );
    }
    // 按分组顺序排列结果
    const List<String> groupOrder = [
      '播放设置',
      '外观设置',
      '推荐设置',
      '隐私设置',
      '其他设置',
    ];
    final List<SettingEntry> sorted = [...results]..sort((a, b) {
        final gi = groupOrder.indexOf(a.group);
        final gj = groupOrder.indexOf(b.group);
        return (gi == -1 ? 99 : gi).compareTo(gj == -1 ? 99 : gj);
      });

    return ListView(
      children: [
        for (var i = 0; i < sorted.length; i++)
          _buildEntry(sorted[i], i, sorted, titleStyle, subTitleStyle),
      ],
    );
  }

  /// 分组内最后一个元素后追加分割线
  Widget _buildEntry(SettingEntry entry, int index, List<SettingEntry> sorted,
      TextStyle titleStyle, TextStyle subTitleStyle) {
    bool isLastOfGroup = index == sorted.length - 1 ||
        sorted[index + 1].group != entry.group;
    Widget child;
    if (entry.setKey != null) {
      // 纯开关项：直接可操作
      child = SetSwitchItem(
        title: entry.title,
        subTitle: entry.subtitle,
        setKey: entry.setKey,
        defaultVal: entry.defaultVal,
      );
    } else {
      // 跳转项
      child = ListTile(
        dense: false,
        onTap: () => Get.toNamed(entry.route!),
        title: Text(entry.title, style: titleStyle),
        subtitle: entry.subtitle != null
            ? Text(entry.subtitle!, style: subTitleStyle)
            : null,
        trailing: const Icon(Icons.chevron_right),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 2),
          child: Text(entry.group, style: subTitleStyle),
        ),
        child,
        if (isLastOfGroup) const Divider(height: 1),
      ],
    );
  }
}