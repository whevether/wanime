import 'package:flutter/material.dart';
import 'package:wanime/app/app_style.dart';
import 'package:wanime/models/user/subscribe_novel_model.dart';
import 'package:wanime/modules/user/subscribe/novel/novel_subscribe_controller.dart';

import 'package:wanime/routes/app_navigator.dart';
import 'package:wanime/widgets/keep_alive_wrapper.dart';
import 'package:wanime/widgets/net_image.dart';
import 'package:wanime/widgets/page_grid_view.dart';
import 'package:wanime/widgets/shadow_card.dart';
import 'package:get/get.dart';

class NovelSubscribeView extends StatelessWidget {
  final NovelSubscribeController controller;
  NovelSubscribeView({super.key})
      : controller = Get.put(NovelSubscribeController());

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                buildFilter(
                  // ignore: invalid_use_of_protected_member
                  types: controller.letters,
                  value: controller.letter.value,
                  onSelected: (e) {
                    controller.letter.value = e;
                    controller.refreshData();
                  },
                ),
                buildFilter(
                  types: controller.types,
                  value: controller.type.value,
                  onSelected: (e) {
                    controller.type.value = e;
                    controller.refreshData();
                  },
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.withValues(alpha:.2),
            height: 1.0,
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              var count = constraints.maxWidth ~/ 160;
              if (count < 3) count = 3;
              return PageGridView(
                pageController: controller,
                firstRefresh: true,
                crossAxisCount: count,
                padding: AppStyle.edgeInsetsA12,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemBuilder: (context, i) {
                  var item = controller.list[i];
                  return buildItem(item);
                },
              );
            }),
          ),
          Obx(
            () => Offstage(
              offstage: !controller.editMode.value,
              child: SizedBox(
                height: 48,
                child: BottomAppBar(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: controller.cancelSub,
                        icon: const Icon(Icons.favorite_border),
                        label: const Text("取消订阅"),
                      ),
                      TextButton.icon(
                        onPressed: controller.cancelEdit,
                        icon: const Icon(Icons.cancel_outlined),
                        label: const Text("取消"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(UserSubscribeNovelModel item) {
    return ShadowCard(
      onTap: () {
        if (controller.editMode.value) {
          item.isChecked.value = !item.isChecked.value;
          return;
        }
        item.hasNew.value = false;
        AppNavigator.toNovelDetail(item.id);
      },
      onLongPress: () {
        if (controller.editMode.value) {
          return;
        }

        item.isChecked.value = true;
        controller.editMode.value = true;
      },
      radius: 4,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 27 / 36,
                    child: NetImage(
                      item.subImg,
                      borderRadius: 4,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            item.status == "连载中" ? Colors.blue : Colors.orange,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                      ),
                      padding:
                          AppStyle.edgeInsetsH8.copyWith(top: 2, bottom: 2),
                      child: Text(
                        item.status,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Obx(
                      () => Visibility(
                        visible: item.hasNew.value,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                          ),
                          padding:
                              AppStyle.edgeInsetsH8.copyWith(top: 2, bottom: 2),
                          child: const Text(
                            "新",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppStyle.vGap4,
              Padding(
                padding: AppStyle.edgeInsetsH4,
                child: Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1.2,
                  ),
                ),
              ),
              AppStyle.vGap4,
              Padding(
                padding: AppStyle.edgeInsetsH4,
                child: Text(
                  "更新 ${item.subUpdate}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    height: 1.2,
                  ),
                ),
              ),
              AppStyle.vGap4,
            ],
          ),
          Obx(
            () => Positioned(
              right: 0,
              top: 0,
              child: Offstage(
                offstage: !controller.editMode.value,
                child: Checkbox(
                  value: item.isChecked.value,
                  onChanged: (e) {
                    item.isChecked.value = e!;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilter({
    required Map types,
    required dynamic value,
    required Function(dynamic) onSelected,
  }) {
    return Expanded(
      child: PopupMenuButton(
        onSelected: onSelected,
        itemBuilder: (c) => types.keys
            .map(
              (k) => CheckedPopupMenuItem(
                value: k,
                checked: k == value,
                child: Text(types[k] ?? ""),
              ),
            )
            .toList(),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                types[value] ?? "",
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
