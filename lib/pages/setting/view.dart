import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilipala/pages/setting/index.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          '设置',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () => Get.toNamed('/settingSearch'),
            dense: false,
            leading: const Icon(Icons.search),
            title: const Text('搜索设置'),
            subtitle: const Text('搜索全部设置项，如：弹幕'),
          ),
          const Divider(height: 1),
          ListTile(
            onTap: () => Get.toNamed('/privacySetting'),
            dense: false,
            title: const Text('隐私设置'),
          ),
          ListTile(
            onTap: () => Get.toNamed('/recommendSetting'),
            dense: false,
            title: const Text('推荐设置'),
          ),
          ListTile(
            onTap: () => Get.toNamed('/playSetting'),
            dense: false,
            title: const Text('播放设置'),
          ),
          ListTile(
            onTap: () => Get.toNamed('/styleSetting'),
            dense: false,
            title: const Text('外观设置'),
          ),
          ListTile(
            onTap: () => Get.toNamed('/extraSetting'),
            dense: false,
            title: const Text('其他设置'),
          ),
          Obx(
            () => Visibility(
              visible: settingController.userLogin.value,
              child: ListTile(
                onTap: () => settingController.loginOut(),
                dense: false,
                title: const Text('退出登录'),
              ),
            ),
          ),
          ListTile(
            onTap: () => Get.toNamed('/about'),
            dense: false,
            title: const Text('关于'),
          ),
        ],
      ),
    );
  }
}
