import 'package:wanime/app/controller/base_controller.dart';
import 'package:wanime/models/comment/comment_item.dart';
import 'package:wanime/requests/comment_request.dart';

class CommentListController extends BasePageController<CommentItem> {
  final int type;
  final int objId;
  final bool isHot;
  final CommentRequest request = CommentRequest();
  CommentListController({
    required this.type,
    required this.objId,
    required this.isHot,
  });

  @override
  Future<List<CommentItem>> getData(int page, int pageSize) async {
    if (isHot) {
      return await request.getHotComment(
        type: type,
        objId: objId,
        page: page,
      );
    } else {
      return await request.getLatestComment(
        type: type,
        objId: objId,
        page: page,
      );
    }
  }
}
