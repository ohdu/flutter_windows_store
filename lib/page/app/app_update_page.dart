import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_windows_store/entity/app_info.dart';
import 'package:flutter_windows_store/page/app/app_update_controller.dart';
import 'package:get/get.dart';

class AppUpdatePage extends StatefulWidget {
  const AppUpdatePage({super.key});

  @override
  State<AppUpdatePage> createState() => _AppUpdatePageState();
}

class _AppUpdatePageState extends State<AppUpdatePage>
    with AutomaticKeepAliveClientMixin {
  final _controller = Get.put(AppUpdateController());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScaffoldPage(
        padding: const EdgeInsets.all(16),
        header: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '已安装应用',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        content: GetBuilder<AppUpdateController>(
          builder: (_) =>
              ListView.builder(
                padding:const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  AppInfo appInfo = _controller.appInfo[index];
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: Card(
                          child: Row(
                            children: [
                              // IconButton(
                              //   onPressed: () {
                              //     _controller.installAppList();
                              //   },
                              //   icon: Image.file(File(
                              //       '${appInfo.installLocation}.ico')),
                              // ),
                              Column(
                                children: [
                                  Text(appInfo.name),
                                  Text(appInfo.companyName)
                                ],
                              )
                            ],
                          )),
                  );
                },
                itemCount: _controller.appInfo.length,
              ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
