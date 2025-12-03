// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  static String m0(howMany) => Intl.plural(howMany, zero: 'There are no left', one: 'There is ${howMany} left', other: 'There are ${howMany} left');

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'cancel': MessageLookupByLibrary.simpleMessage('Cancel'),
    'chat': MessageLookupByLibrary.simpleMessage('Chat'),
    'find': MessageLookupByLibrary.simpleMessage('Find'),
    'home': MessageLookupByLibrary.simpleMessage('Home'),
    'language': MessageLookupByLibrary.simpleMessage('Language'),
    'login': MessageLookupByLibrary.simpleMessage('Login'),
    'logout': MessageLookupByLibrary.simpleMessage('Logout'),
    'logoutTip': MessageLookupByLibrary.simpleMessage('Are you sure to logout?'),
    'my': MessageLookupByLibrary.simpleMessage('My'),
    'password': MessageLookupByLibrary.simpleMessage('Password'),
    'paswordRequired': MessageLookupByLibrary.simpleMessage('password can not be empty!'),
    'remainingMessage': m0,
    'theme': MessageLookupByLibrary.simpleMessage('Theme'),
    'title': MessageLookupByLibrary.simpleMessage('wchat'),
    'userName': MessageLookupByLibrary.simpleMessage('User Name'),
    'userNameRequired': MessageLookupByLibrary.simpleMessage('User name can not be empty!'),
    'yes': MessageLookupByLibrary.simpleMessage('Yes')
  };
}
