import 'package:flutter/material.dart';
import 'package:wanime/services/app_settings_service.dart';
import 'package:wanime/app/dialog_utils.dart';
import 'package:wanime/app/event_bus.dart';
import 'package:wanime/app/utils.dart';
import 'package:wanime/modules/comic/home/comic_home_page.dart';
import 'package:wanime/modules/news/home/news_home_controller.dart';
import 'package:wanime/modules/news/home/news_home_page.dart';
import 'package:wanime/modules/novel/home/novel_home_controller.dart';
import 'package:wanime/modules/novel/home/novel_home_page.dart';
import 'package:wanime/modules/user/user_home_page.dart';
import 'package:get/get.dart';
import 'package:multi_split_view/multi_split_view.dart';

class IndexController extends GetxController {
  final index = 0.obs;
  final showContent = false.obs;
  final GlobalKey indexKey = GlobalKey();
  final GlobalKey subRouterKey = GlobalKey();

  final MultiSplitViewController multiSplitViewController =
      MultiSplitViewController(areas: [
    Area(min: 400, size: 500),
  ]);
  final pages = [
    const ComicHomePage(),
    const SizedBox(),
    const SizedBox(),
    const UserHomePage(),
  ];
  @override
  void onInit() {
    Future.delayed(Duration.zero, showFirstRun);
    super.onInit();
  }

  @override
  void onClose() {}

  void setIndex(i) {
    if (i == 1 && pages[i] is SizedBox) {
      Get.put(NewsHomeController());
      pages[i] = const NewsHomePage();
    } else if (i == 2 && pages[i] is SizedBox) {
      Get.put(NovelHomeController());
      pages[i] = const NovelHomePage();
    }
    if (index.value == i) {
      EventBus.instance.emit<int>(EventBus.kBottomNavigationBarClicked, i);
    }
    index.value = i;
  }

  void showFirstRun() async {
    if (AppSettingsService.instance.firstRun) {
      AppSettingsService.instance.setNoFirstRun();
      DialogUtils.showStatement();
      Utils.checkUpdate();
    } else {
      Utils.checkUpdate();
    }
  }
}
