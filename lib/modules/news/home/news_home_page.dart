import 'package:flutter/material.dart';
import 'package:wanime/modules/news/home/news_home_controller.dart';
import 'package:wanime/modules/news/home/news_list_view.dart';
import 'package:wanime/widgets/status/app_error_widget.dart';
import 'package:wanime/widgets/status/app_loadding_widget.dart';
import 'package:wanime/widgets/tab_appbar.dart';
import 'package:get/get.dart';

class NewsHomePage extends GetView<NewsHomeController> {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsHomeController>(
      init: controller,
      builder: (controller) {
        if (controller.loadding) {
          return const Scaffold(
            body: AppLoaddingWidget(),
          );
        }
        if (!controller.loadding && controller.error) {
          return Scaffold(
            body: AppErrorWidget(
              errorMsg: controller.errorMsg,
              onRefresh: controller.loadCategores,
            ),
          );
        }
        return Scaffold(
          appBar: TabAppBar(
            tabs:
                controller.categores.map((e) => Tab(text: e.tagName)).toList(),
            controller: controller.tabController,
          ),
          body: TabBarView(
            controller: controller.tabController,
            children:
                controller.categores.map((e) => NewsListView(tag: e)).toList(),
          ),
        );
      },
    );
  }
}
