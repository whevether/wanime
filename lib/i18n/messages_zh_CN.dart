// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(
    String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'zh_CN';

  static String m0(howMany) => Intl.plural(howMany, zero: '没有了', one: '有 ${howMany} 条', other: '有 ${howMany} 条');

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'cancel': MessageLookupByLibrary.simpleMessage('取消'),
    'chat': MessageLookupByLibrary.simpleMessage('聊天'),
    'find': MessageLookupByLibrary.simpleMessage('发现'),
    'home': MessageLookupByLibrary.simpleMessage('主页'),
    'language': MessageLookupByLibrary.simpleMessage('语言'),
    'login': MessageLookupByLibrary.simpleMessage('登录'),
    'logout': MessageLookupByLibrary.simpleMessage('退出登录'),
    'logoutTip': MessageLookupByLibrary.simpleMessage('确定退出登录?'),
    'my': MessageLookupByLibrary.simpleMessage('我的'),
    'password': MessageLookupByLibrary.simpleMessage('密码'),
    'paswordRequired': MessageLookupByLibrary.simpleMessage('密码不能为空!'),
    'remainingMessage': m0,
    'theme': MessageLookupByLibrary.simpleMessage('主题'),
    'title': MessageLookupByLibrary.simpleMessage('wchat'),
    'userName': MessageLookupByLibrary.simpleMessage('用户名'),
    'userNameRequired': MessageLookupByLibrary.simpleMessage('用户名不能为空!'),
    'yes': MessageLookupByLibrary.simpleMessage('确定')
  };
}
