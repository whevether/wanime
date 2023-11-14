import 'package:wanime/app/controller/base_controller.dart';
import 'package:wanime/models/comic/category_item_model.dart';
import 'package:wanime/requests/comic_request.dart';
import 'package:wanime/routes/app_navigator.dart';

class ComicCategoryController
    extends BasePageController<ComicCategoryItemModel> {
  final ComicRequest request = ComicRequest();

  @override
  Future<List<ComicCategoryItemModel>> getData(int page, int pageSize) async {
    if (page > 1) {
      return [];
    }
    var ls = await request.categores();

    return ls;
  }

  void toDetail(ComicCategoryItemModel item) {
    AppNavigator.toComicCategoryDetail(item.tagId);
  }
}
