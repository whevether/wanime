import 'package:wanime/app/controller/base_controller.dart';
import 'package:wanime/models/comment/user_comment_item.dart';
import 'package:wanime/requests/comment_request.dart';

class UserCommentController extends BasePageController<UserCommentItem> {
  final int type;
  final int userId;
  UserCommentController({required this.type, required this.userId});
  final CommentRequest request = CommentRequest();

  @override
  Future<List<UserCommentItem>> getData(int page, int pageSize) async {
    return await request.getUserComment(
      type: type,
      uid: userId,
      page: page - 1,
    );
  }
}
