import 'package:flutter/material.dart';
import 'package:wanime/app/app_style.dart';
import 'package:wanime/app/utils.dart';
import 'package:wanime/modules/comic/home/special/comic_special_controller.dart';
import 'package:wanime/widgets/keep_alive_wrapper.dart';
import 'package:wanime/widgets/net_image.dart';
import 'package:wanime/widgets/page_list_view.dart';
import 'package:wanime/widgets/shadow_card.dart';
import 'package:get/get.dart';

class ComicSpecialView extends StatelessWidget {
  final ComicSpecialController controller;
  ComicSpecialView({Key? key})
      : controller = Get.put(ComicSpecialController()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: PageListView(
        pageController: controller,
        firstRefresh: true,
        showPageLoadding: false,
        padding: AppStyle.edgeInsetsA12.copyWith(top: 0),
        separatorBuilder: (context, i) => AppStyle.vGap12,
        itemBuilder: (context, i) {
          var item = controller.list[i];
          return ShadowCard(
            onTap: () {
              controller.toDetail(item);
            },
            radius: 8,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 710 / 284,
                  child: NetImage(
                    item.smallCover,
                    width: 710,
                    height: 354,
                  ),
                ),
                Padding(
                  padding: AppStyle.edgeInsetsA8,
                  child: Row(
                    children: [
                      Expanded(child: Text(item.title)),
                      Text(
                        Utils.formatTimestampToDate(item.createTime),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
