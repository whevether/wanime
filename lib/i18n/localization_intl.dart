import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

class LanguageLocalizations {
  static Future<LanguageLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return LanguageLocalizations();
    });
  }

  static LanguageLocalizations? of(BuildContext context) {
    return Localizations.of<LanguageLocalizations>(context, LanguageLocalizations);
  }

  String get title {
    return Intl.message(
      'wchat',
      name: 'title',
      desc: 'Title for the  application',
    );
  }

  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Language of application',
    );
  }

  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: 'Theme of application',
    );
  }

  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: 'Login action',
    );
  }

  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: 'Logout action',
    );
  }

  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'Title of home page',
    );
  }

  String get find {
    return Intl.message(
      'Find',
      name: 'find',
      desc: 'Title of find page',
    );
  }

  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: 'Title of chat page',
    );
  }

  String get my {
    return Intl.message(
      'My',
      name: 'my',
      desc: 'Title of my page',
    );
  }

  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: 'yes action',
    );
  }

  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel action',
    );
  }

  String get logoutTip {
    return Intl.message(
      'Are you sure to logout?',
      name: 'logoutTip',
      desc: 'Logout tip',
    );
  }

  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: 'User account',
    );
  }
  String get userNameRequired {
    return Intl.message(
      'User name can not be empty!',
      name: 'userNameRequired',
      desc: 'user name required',
    );
  }

  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'password',
    );
  }

  String get paswordRequired {
    return Intl.message(
      'password can not be empty!',
      name: 'paswordRequired',
      desc: 'password required',
    );
  }
  // 已读/未读 消息
  String remainingMessage(int howMany) => Intl.plural(howMany,
      zero: 'There are no left',
      one: 'There is $howMany left',
      other: 'There are $howMany left',
      name: "remainingMessage",
      args: [howMany],
      desc: "How many remain after archiving.",
      examples: const {'howMany': 42, 'userName': 'Fred'});
}

//Locale代理类
class LanguageLocalizationsDelegate
    extends LocalizationsDelegate<LanguageLocalizations> {
  const LanguageLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<LanguageLocalizations> load(Locale locale) {
    //3
    return LanguageLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(LanguageLocalizationsDelegate old) => false;
}