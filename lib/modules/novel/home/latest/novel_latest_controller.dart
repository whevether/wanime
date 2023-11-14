import 'package:wanime/app/controller/base_controller.dart';
import 'package:wanime/models/novel/latest_model.dart';
import 'package:wanime/requests/novel_request.dart';

class NovelLatestController extends BasePageController<NovelLatestModel> {
  final NovelRequest request = NovelRequest();

  @override
  Future<List<NovelLatestModel>> getData(int page, int pageSize) async {
    var ls = await request.latest(page: page - 1);

    return ls;
  }
}
