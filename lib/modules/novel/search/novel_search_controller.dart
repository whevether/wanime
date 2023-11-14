import 'package:flutter/material.dart';
import 'package:wanime/app/controller/base_controller.dart';
import 'package:wanime/app/log.dart';
import 'package:wanime/models/novel/search_model.dart';
import 'package:wanime/requests/novel_request.dart';
import 'package:get/get.dart';

class NovelSearchController extends BasePageController<NovelSearchModel> {
  final String keyword;
  NovelSearchController(this.keyword) {
    searchController = TextEditingController(text: keyword);
  }
  late TextEditingController searchController;
  final NovelRequest request = NovelRequest();

  String _keyword = "";
  RxMap<int, String> hotWords = <int, String>{}.obs;
  var showHotWord = true.obs;

  @override
  void onInit() {
    loadHotWord();
    if (keyword.isNotEmpty) {
      submit();
    }
    super.onInit();
  }

  void submit() {
    if (searchController.text.isEmpty) {
      list.clear();
      showHotWord.value = true;
      return;
    }
    showHotWord.value = false;
    _keyword = searchController.text;
    refreshData();
  }

  @override
  Future<List<NovelSearchModel>> getData(int page, int pageSize) async {
    if (searchController.text.isEmpty) {
      return [];
    }
    return await request.search(keyword: _keyword, page: page - 1);
  }

  void loadHotWord() async {
    try {
      hotWords.value = await request.searchHotWord();
    } catch (e) {
      Log.logPrint(e);
    }
  }
}
