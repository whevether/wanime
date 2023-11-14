import 'package:flutter/material.dart';
import 'package:wanime/app/app_style.dart';
import 'package:wanime/app/utils.dart';
import 'package:wanime/models/user/comic_history_model.dart';
import 'package:wanime/modules/user/history/comic/comic_history_controller.dart';
import 'package:wanime/routes/app_navigator.dart';
import 'package:wanime/widgets/keep_alive_wrapper.dart';
import 'package:wanime/widgets/net_image.dart';
import 'package:wanime/widgets/page_list_view.dart';
import 'package:get/get.dart';

class ComicHistoryView extends StatelessWidget {
  final ComicHistoryController controller;
  ComicHistoryView({super.key})
      : controller = Get.put(ComicHistoryController());

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: PageListView(
        pageController: controller,
        firstRefresh: true,
        loadMore: false,
        separatorBuilder: (context, i) => Divider(
          endIndent: 12,
          indent: 12,
          color: Colors.grey.withOpacity(.2),
          height: 1,
        ),
        itemBuilder: (context, i) {
          var item = controller.list[i];
          return buildItem(item);
        },
      ),
    );
  }

  Widget buildItem(UserComicHistoryModel item) {
    return InkWell(
      onTap: () {
        AppNavigator.toComicDetail(item.comicId);
      },
      child: Container(
        padding: AppStyle.edgeInsetsA12,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NetImage(
              item.cover,
              width: 80,
              height: 110,
              borderRadius: 4,
            ),
            AppStyle.hGap12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.comicName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppStyle.vGap4,
                  Text("看到${item.chapterName} ${item.record}页",
                      style: const TextStyle(color: Colors.grey, fontSize: 14)),
                  AppStyle.vGap4,
                  Text("观看于${Utils.formatTimestamp(item.viewingTime ?? 0)}",
                      style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
