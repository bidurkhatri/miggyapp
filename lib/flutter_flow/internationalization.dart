import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // MyProfile
  {
    'kvr0x07s': {
      'en': 'Edit profile',
      'fr': '',
    },
    'rn0d986h': {
      'en': 'Footprints',
      'fr': '',
    },
    '91eyqgiz': {
      'en': 'Footprints',
      'fr': '',
    },
    '08i84m3l': {
      'en': 'Footprints',
      'fr': '',
    },
    'l3wwb7ts': {
      'en': 'Statistics',
      'fr': '',
    },
    'gsc9gjoe': {
      'en': '0',
      'fr': '',
    },
    'ovhyatm1': {
      'en': 'Likes',
      'fr': '',
    },
    'xbbl7swx': {
      'en': '3',
      'fr': '',
    },
    'h87ov3a5': {
      'en': 'Footprints',
      'fr': '',
    },
    'ri4if3p5': {
      'en': '1',
      'fr': '',
    },
    'cp3exqke': {
      'en': 'Friends',
      'fr': '',
    },
    'k04uralx': {
      'en': 'Chatrooms',
      'fr': '',
    },
    'r58scxj0': {
      'en': 'Followers',
      'fr': '',
    },
    'sgfeo50t': {
      'en': 'Following',
      'fr': '',
    },
    'q7085zg8': {
      'en': '0',
      'fr': '',
    },
    '2lm6rabn': {
      'en': 'Gifts Sent',
      'fr': '',
    },
    '61y12bn6': {
      'en': '163',
      'fr': '',
    },
    'lvoj1wb8': {
      'en': 'Gifts Re..',
      'fr': '',
    },
    '3aasstcf': {
      'en': 'Recent Post',
      'fr': '',
    },
    '1p8oyrw1': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Home
  {
    'cgq3npt3': {
      'en': 'Hi bidur_',
      'fr': '',
    },
    'juq224u8': {
      'en': '',
      'fr': '',
    },
    'qlyg7mlh': {
      'en': '1',
      'fr': '',
    },
    'cw2ty3w7': {
      'en': 'Email',
      'fr': '',
    },
    't9kugc3a': {
      'en': 'Notifications',
      'fr': '',
    },
    'z4tkua9q': {
      'en': 'Friends (0/1)',
      'fr': '',
    },
    'thgi97yk': {
      'en': 'Create a post',
      'fr': '',
    },
    '0ip8q713': {
      'en': 'Chatroom',
      'fr': '',
    },
    'vcdbsc5l': {
      'en': 'Search',
      'fr': '',
    },
    'f0h1cidy': {
      'en': 'Create a Chatroom',
      'fr': '',
    },
    'ppsp2kcp': {
      'en': 'Chatroms',
      'fr': '',
    },
    'onhsr14a': {
      'en': 'Gameroom',
      'fr': '',
    },
    '0peothiu': {
      'en': 'Favorite rooms',
      'fr': '',
    },
    'yyrrcddo': {
      'en': 'JT',
      'fr': '',
    },
    'l1bjz70g': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'xanhh6ri': {
      'en': '(10/16)',
      'fr': '',
    },
    'skuinn9e': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '5k0gjsut': {
      'en': 'RT',
      'fr': '',
    },
    'xhsj707e': {
      'en': 'Rkado Town',
      'fr': '',
    },
    'hzdk4mv3': {
      'en': '(10/16)',
      'fr': '',
    },
    '732wi9na': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'zgdwqe2l': {
      'en': 'OB',
      'fr': '',
    },
    'lm2enew6': {
      'en': 'Online Bot',
      'fr': '',
    },
    '8kwinjsz': {
      'en': '(10/16)',
      'fr': '',
    },
    'p31c2j2d': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'sm3m7p69': {
      'en': 'IN',
      'fr': '',
    },
    'cvoje1u4': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'gr4mq73m': {
      'en': '(10/16)',
      'fr': '',
    },
    'yndhnv6g': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '5birxemx': {
      'en': 'IN',
      'fr': '',
    },
    'nugn6m54': {
      'en': 'Indonesia',
      'fr': '',
    },
    'h3b1pln6': {
      'en': '(10/16)',
      'fr': '',
    },
    '2ykrwkm5': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'z3w71yx9': {
      'en': 'Trending Rooms',
      'fr': '',
    },
    '8j58wmea': {
      'en': 'JT',
      'fr': '',
    },
    '5xhmjzkf': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'dwv2bhnv': {
      'en': '(10/16)',
      'fr': '',
    },
    'oeacemyn': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'u5ovmumh': {
      'en': 'RT',
      'fr': '',
    },
    'uz5r752h': {
      'en': 'Rkado Town',
      'fr': '',
    },
    'erq7twi8': {
      'en': '(10/16)',
      'fr': '',
    },
    'zpo591ui': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    's13cjzo2': {
      'en': 'OB',
      'fr': '',
    },
    'yx12q4gz': {
      'en': 'Online Bot',
      'fr': '',
    },
    '9mlvzkg7': {
      'en': '(10/16)',
      'fr': '',
    },
    'x3fldr0y': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'i7tt9v51': {
      'en': 'IN',
      'fr': '',
    },
    'wauqp4wv': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'mqg8i5wa': {
      'en': '(10/16)',
      'fr': '',
    },
    'mwzz3o0n': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'yucvv2ta': {
      'en': 'IN',
      'fr': '',
    },
    'qqwwtsrq': {
      'en': 'Indonesia',
      'fr': '',
    },
    'ruc1s8lh': {
      'en': '(10/16)',
      'fr': '',
    },
    'okbu09x8': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '65x9ebbx': {
      'en': 'Recent Rooms',
      'fr': '',
    },
    'xiemycry': {
      'en': 'JT',
      'fr': '',
    },
    '74jww00m': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'dfv268p4': {
      'en': '(10/16)',
      'fr': '',
    },
    'm1dqhobt': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'mcgfyb75': {
      'en': 'RT',
      'fr': '',
    },
    'p79alawt': {
      'en': 'Rkado Town',
      'fr': '',
    },
    '987df49r': {
      'en': '(10/16)',
      'fr': '',
    },
    'vsulsi4r': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'lt8pfi91': {
      'en': 'OB',
      'fr': '',
    },
    'ddarqaya': {
      'en': 'Online Bot',
      'fr': '',
    },
    'uww8tdei': {
      'en': '(10/16)',
      'fr': '',
    },
    'xu9q7g25': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'kge9iq40': {
      'en': 'IN',
      'fr': '',
    },
    'p658pc8w': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'vzikku5a': {
      'en': '(10/16)',
      'fr': '',
    },
    'j34ek9pn': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '1c1z8erl': {
      'en': 'IN',
      'fr': '',
    },
    'xyvgpjes': {
      'en': 'Indonesia',
      'fr': '',
    },
    'jz1c0dwo': {
      'en': '(10/16)',
      'fr': '',
    },
    'hu36a4x5': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '43s2idh8': {
      'en': 'Country Rooms',
      'fr': '',
    },
    'wdh8ocya': {
      'en': 'JT',
      'fr': '',
    },
    'st3yfbiu': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'jg7nzmn3': {
      'en': '(10/16)',
      'fr': '',
    },
    'u5w4b1p1': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '1w0gkcvf': {
      'en': 'RT',
      'fr': '',
    },
    'utde03ix': {
      'en': 'Rkado Town',
      'fr': '',
    },
    'zk63m05q': {
      'en': '(10/16)',
      'fr': '',
    },
    '6o5g8lgg': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'zzz96bz4': {
      'en': 'OB',
      'fr': '',
    },
    'qs9zzd7x': {
      'en': 'Online Bot',
      'fr': '',
    },
    '1xhqurrb': {
      'en': '(10/16)',
      'fr': '',
    },
    'siompkon': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '4oabpct7': {
      'en': 'IN',
      'fr': '',
    },
    '9yhdd5rl': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    '5ouqxg48': {
      'en': '(10/16)',
      'fr': '',
    },
    'h55iw3yz': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'marbjr13': {
      'en': 'IN',
      'fr': '',
    },
    '9c70p5s4': {
      'en': 'Indonesia',
      'fr': '',
    },
    'vta1wsvh': {
      'en': '(10/16)',
      'fr': '',
    },
    'sv29ldtu': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '2wq80g0y': {
      'en': 'Jackpot rooms',
      'fr': '',
    },
    'yysgvjgu': {
      'en': 'JB',
      'fr': '',
    },
    '63i6u454': {
      'en': 'Cricket rooms',
      'fr': '',
    },
    'emidv456': {
      'en': 'JT',
      'fr': '',
    },
    'cr7ewoh2': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    '7k6efuhy': {
      'en': '(10/16)',
      'fr': '',
    },
    'mwdbzo4d': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '8tibloso': {
      'en': 'RT',
      'fr': '',
    },
    'a9a2v4wg': {
      'en': 'Rkado Town',
      'fr': '',
    },
    'rykuca4n': {
      'en': '(10/16)',
      'fr': '',
    },
    'as22ze40': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'yf22jjwx': {
      'en': 'OB',
      'fr': '',
    },
    'fxacg2t0': {
      'en': 'Online Bot',
      'fr': '',
    },
    'xwv12yjl': {
      'en': '(10/16)',
      'fr': '',
    },
    'gwnqidix': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'ab7ddkve': {
      'en': 'IN',
      'fr': '',
    },
    'b0064gg9': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'lj0w052w': {
      'en': '(10/16)',
      'fr': '',
    },
    'bbfm7cg9': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'apjs6g5x': {
      'en': 'IN',
      'fr': '',
    },
    '6ms6irvj': {
      'en': 'Indonesia',
      'fr': '',
    },
    '84jbuktr': {
      'en': '(10/16)',
      'fr': '',
    },
    '6vws9sbk': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'j59c79x2': {
      'en': 'Dice rooms',
      'fr': '',
    },
    'wvj6btsn': {
      'en': 'JT',
      'fr': '',
    },
    'r5qlv1pl': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    '1huc5j65': {
      'en': '(10/16)',
      'fr': '',
    },
    '9keres9h': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'aw8bhvex': {
      'en': 'RT',
      'fr': '',
    },
    'sw700hbo': {
      'en': 'Rkado Town',
      'fr': '',
    },
    'mfz0yl9z': {
      'en': '(10/16)',
      'fr': '',
    },
    '2u3hbc4o': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'gjvngxj4': {
      'en': 'OB',
      'fr': '',
    },
    'm3dxgkli': {
      'en': 'Online Bot',
      'fr': '',
    },
    'ojkftvu1': {
      'en': '(10/16)',
      'fr': '',
    },
    'haw07m9d': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'a37r30u0': {
      'en': 'IN',
      'fr': '',
    },
    '4hnxdga2': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'zbknfbus': {
      'en': '(10/16)',
      'fr': '',
    },
    'vl624m6s': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'msdz51ye': {
      'en': 'IN',
      'fr': '',
    },
    'fu8or76x': {
      'en': 'Indonesia',
      'fr': '',
    },
    '8m6xn4og': {
      'en': '(10/16)',
      'fr': '',
    },
    '8jie2iqe': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'qs93vv4u': {
      'en': 'Jackpot rooms',
      'fr': '',
    },
    'zk26pusm': {
      'en': 'JT',
      'fr': '',
    },
    'abrljlsx': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    '6o91h780': {
      'en': '(10/16)',
      'fr': '',
    },
    's0p0vlqa': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'tdfri0k0': {
      'en': 'RT',
      'fr': '',
    },
    '0yfsa80f': {
      'en': 'Rkado Town',
      'fr': '',
    },
    'whfqulp5': {
      'en': '(10/16)',
      'fr': '',
    },
    '7ypvgle9': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'a3chhc80': {
      'en': 'OB',
      'fr': '',
    },
    'b2zp5ukz': {
      'en': 'Online Bot',
      'fr': '',
    },
    'dfb4pkgm': {
      'en': '(10/16)',
      'fr': '',
    },
    'qhdfm77m': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'mafbls8b': {
      'en': 'IN',
      'fr': '',
    },
    'mfnw9pur': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'd2azyaqp': {
      'en': '(10/16)',
      'fr': '',
    },
    '3e3ec5an': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '94shqegw': {
      'en': 'IN',
      'fr': '',
    },
    'k7rfzk1u': {
      'en': 'Indonesia',
      'fr': '',
    },
    'sh7uyly8': {
      'en': '(10/16)',
      'fr': '',
    },
    'q0eu1rch': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'y8zdv6n6': {
      'en': 'Teenpatti rooms',
      'fr': '',
    },
    'xju26ich': {
      'en': 'JT',
      'fr': '',
    },
    '3d42hvo0': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    'iubsmucr': {
      'en': '(10/16)',
      'fr': '',
    },
    '395yb5f4': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'xj4m7h8h': {
      'en': 'RT',
      'fr': '',
    },
    'udwlv7tc': {
      'en': 'Rkado Town',
      'fr': '',
    },
    'wrtcm8dd': {
      'en': '(10/16)',
      'fr': '',
    },
    '6u0b7bex': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'cccss2fy': {
      'en': 'OB',
      'fr': '',
    },
    'udgpoj3n': {
      'en': 'Online Bot',
      'fr': '',
    },
    'spjdcfx5': {
      'en': '(10/16)',
      'fr': '',
    },
    'axplrduo': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    '8bc8pv60': {
      'en': 'IN',
      'fr': '',
    },
    'rnc47g5w': {
      'en': 'Jackbot 5',
      'fr': '',
    },
    '2rz29mra': {
      'en': '(10/16)',
      'fr': '',
    },
    'osbr0kbc': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'wqegn1m8': {
      'en': 'IN',
      'fr': '',
    },
    'rzk6pdm6': {
      'en': 'Indonesia',
      'fr': '',
    },
    '2xprea05': {
      'en': '(10/16)',
      'fr': '',
    },
    '4udomx5m': {
      'en': 'Welcome to roll jhada burger',
      'fr': '',
    },
    'hjzxs2oc': {
      'en': '1',
      'fr': '',
    },
    'tp7kqk20': {
      'en': 'My Account',
      'fr': '',
    },
    'b0wsg5jo': {
      'en': 'News & Announcements',
      'fr': '',
    },
    '6i8iuzwl': {
      'en': 'Users',
      'fr': '',
    },
    'kqi6473s': {
      'en': 'Authorized People',
      'fr': '',
    },
    'p7eeeekn': {
      'en': 'Achievement Report',
      'fr': '',
    },
    'r4wi1tfd': {
      'en': 'Miggy World',
      'fr': '',
    },
    'f3h1dds8': {
      'en': 'Miggy Stores',
      'fr': '',
    },
    '42fav2sg': {
      'en': 'Leaderboards',
      'fr': '',
    },
    '6rx00apr': {
      'en': 'Settings',
      'fr': '',
    },
    'zow41jct': {
      'en': 'Refer & Earn',
      'fr': '',
    },
    'ufg9a039': {
      'en': 'Help & Support',
      'fr': '',
    },
    'vzumlzm3': {
      'en': 'Logout',
      'fr': '',
    },
    'yx3ykcua': {
      'en': 'Home',
      'fr': '',
    },
  },
  // settings
  {
    '043t9d7a': {
      'en': 'Settings',
      'fr': '',
    },
    'xepspv2d': {
      'en': 'Change MPIN',
      'fr': '',
    },
    '4lq8jqrl': {
      'en': 'Change Password',
      'fr': '',
    },
    'hk8hr95r': {
      'en': 'Change Security Questions',
      'fr': '',
    },
    'qbdoicpl': {
      'en': 'Block List',
      'fr': '',
    },
    'h2uzg56m': {
      'en': 'Choose Language',
      'fr': '',
    },
    '3dyjewyt': {
      'en': 'Hide Offline Friend',
      'fr': '',
    },
    'kargagvp': {
      'en': 'Dark Mode',
      'fr': '',
    },
    '0jq47vlw': {
      'en': 'Default Colour',
      'fr': '',
    },
    'dpt48tl3': {
      'en': 'Request for Account Delete',
      'fr': '',
    },
    'b9u4v27t': {
      'en': 'Home',
      'fr': '',
    },
  },
  // notification
  {
    'f8vbwqq6': {
      'en': 'Notifications',
      'fr': '',
    },
    'qvpxvixj': {
      'en': 'New Gift!!',
      'fr': '',
    },
    'kagdjxu7': {
      'en': 'may sent you a Tea. Hurray!!',
      'fr': '',
    },
    'vcwrjh8l': {
      'en': '2025-03-25, 07:03 AM',
      'fr': '',
    },
    '043lenms': {
      'en': 'New Gift!!',
      'fr': '',
    },
    '5jlp6nie': {
      'en': 'zarzis sent you a Neko. Hurray!!',
      'fr': '',
    },
    'acz69iok': {
      'en': '2025-03-25, 07:03 AM',
      'fr': '',
    },
    'kqalwaza': {
      'en': 'New Gift!!',
      'fr': '',
    },
    '2zpwe8ci': {
      'en': 'fox sent you a Butterfly. Hurray!!',
      'fr': '',
    },
    'qe1fnmaq': {
      'en': '2025-03-25, 07:03 AM',
      'fr': '',
    },
    'mrlgip0c': {
      'en': 'New Gift!!',
      'fr': '',
    },
    '2pishzik': {
      'en': 'zarzis sent you a Neko. Hurray!!',
      'fr': '',
    },
    '5jc6yllt': {
      'en': '2025-03-25, 07:03 AM',
      'fr': '',
    },
    'mdley9sv': {
      'en': 'New Gift!!',
      'fr': '',
    },
    'jhs4fsza': {
      'en': 'fox sent you a Butterfly. Hurray!!',
      'fr': '',
    },
    'ekpkkl1q': {
      'en': '2025-03-25, 07:03 AM',
      'fr': '',
    },
    'ioz0vdw8': {
      'en': 'Home',
      'fr': '',
    },
  },
  // search_users
  {
    'kvw235d5': {
      'en': 'Search Users',
      'fr': '',
    },
    '7pppstw7': {
      'en': 'Search',
      'fr': '',
    },
    'uhl9rd48': {
      'en': 'Search Results',
      'fr': '',
    },
    'ghcdehi8': {
      'en': 'Follow',
      'fr': '',
    },
    'f5eeihjp': {
      'en': 'Following',
      'fr': '',
    },
    'o25u58qe': {
      'en': 'Follow',
      'fr': '',
    },
    '9gfqdu8l': {
      'en': 'Following',
      'fr': '',
    },
    'yhvqxrv2': {
      'en': 'Home',
      'fr': '',
    },
  },
  // AccountBalance
  {
    'n0843lxw': {
      'en': 'Account',
      'fr': '',
    },
    'zwss3s1t': {
      'en': 'Available Balance',
      'fr': '',
    },
    'ycukwhmt': {
      'en': 'Today Spent: ',
      'fr': '',
    },
    '3gvl7hji': {
      'en': '0.00 Credits',
      'fr': '',
    },
    'k5uy01ck': {
      'en': 'Transfer Credits',
      'fr': '',
    },
    'wxf57vf6': {
      'en': 'Account Statements',
      'fr': '',
    },
    'xl95vh4a': {
      'en': ' ',
      'fr': '',
    },
    'ollhjoy5': {
      'en': ' ',
      'fr': '',
    },
    'mwrzvg15': {
      'en': ' ',
      'fr': '',
    },
    '2lmz808b': {
      'en': 'Received 300 credits on registration.',
      'fr': '',
    },
    'kf5szvrq': {
      'en': '2025-03-25, 07:03 AM',
      'fr': '',
    },
    'h6e0lyfz': {
      'en': '+300.0',
      'fr': '',
    },
    'ks29sm69': {
      'en': 'Received 300 credits on registration.',
      'fr': '',
    },
    's7c8ulij': {
      'en': '2025-03-25, 07:03 AM',
      'fr': '',
    },
    'ae4uz7av': {
      'en': '+300.0',
      'fr': '',
    },
    't71mu6ma': {
      'en': 'Home',
      'fr': '',
    },
  },
  // users
  {
    'pf5jak3j': {
      'en': 'Users',
      'fr': '',
    },
    'pq7p5rbn': {
      'en': 'People You May Know',
      'fr': '',
    },
    'c29eoop2': {
      'en': 'Following',
      'fr': '',
    },
    'sxe0haix': {
      'en': 'Follow',
      'fr': '',
    },
    'p15uv6f3': {
      'en': 'Home',
      'fr': '',
    },
  },
  // AuthorizedPeople
  {
    '2i29jmhz': {
      'en': 'Authorized People',
      'fr': '',
    },
    'vsdkuchp': {
      'en': 'ardi',
      'fr': '',
    },
    'p2dsalme': {
      'en': 'ardi',
      'fr': '',
    },
    '8xbszl6a': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    'tdy2da7j': {
      'en': 'ardi',
      'fr': '',
    },
    '7d78udri': {
      'en': 'Follow',
      'fr': '',
    },
    'ilv74alz': {
      'en': 'ardi',
      'fr': '',
    },
    'kgg3z4md': {
      'en': 'ardi',
      'fr': '',
    },
    'pjg7rjgq': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    'b0tiko5m': {
      'en': 'ardi',
      'fr': '',
    },
    'cjd2rgym': {
      'en': 'Follow',
      'fr': '',
    },
    'oxpymtkq': {
      'en': 'ardi',
      'fr': '',
    },
    '5ea2zxaf': {
      'en': 'ardi',
      'fr': '',
    },
    'oa8cy0sf': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    'tb8rbb62': {
      'en': 'ardi',
      'fr': '',
    },
    'xznjsy54': {
      'en': 'Follow',
      'fr': '',
    },
    '98tszj1m': {
      'en': 'ardi',
      'fr': '',
    },
    '154umjn4': {
      'en': 'ardi',
      'fr': '',
    },
    '7n4vu780': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    'gr55m9j8': {
      'en': 'ardi',
      'fr': '',
    },
    's5zpyv1z': {
      'en': 'Follow',
      'fr': '',
    },
    'x9s7mg5x': {
      'en': 'ardi',
      'fr': '',
    },
    'd5khu0ux': {
      'en': 'ardi',
      'fr': '',
    },
    'xnjk06ip': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    'gsg2b3ug': {
      'en': 'ardi',
      'fr': '',
    },
    '8njw4jkc': {
      'en': 'Follow',
      'fr': '',
    },
    's0eam8gq': {
      'en': 'ardi',
      'fr': '',
    },
    'dj9sa2so': {
      'en': 'ardi',
      'fr': '',
    },
    'xf5n92ne': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    'jvvyf4hg': {
      'en': 'ardi',
      'fr': '',
    },
    '4baq194d': {
      'en': 'Follow',
      'fr': '',
    },
    'to2z0z7i': {
      'en': 'ardi',
      'fr': '',
    },
    'j5sxyp9y': {
      'en': 'ardi',
      'fr': '',
    },
    '6nl94fs6': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    'zuidvz3u': {
      'en': 'ardi',
      'fr': '',
    },
    'pfyf7zih': {
      'en': 'Follow',
      'fr': '',
    },
    'rlrb0nix': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Announcements
  {
    'bt82t6be': {
      'en': 'Announcements',
      'fr': '',
    },
    'yzzkhzaz': {
      'en': 'Removal of inactive Admin zand CS',
      'fr': '',
    },
    'd5jyqxe4': {
      'en':
          'Aenean eget lorem libero. In commodo, nulla et faucibus pharetra, urna nunc venenatis sapien.',
      'fr': '',
    },
    'xb63dfym': {
      'en': '1 week ago',
      'fr': '',
    },
    'k19m9vmr': {
      'en': 'New policy on inactive accounts',
      'fr': '',
    },
    'yjqblfp2': {
      'en':
          'Aenean eget lorem libero. In commodo, nulla et faucibus pharetra, urna nunc venenatis sapien.',
      'fr': '',
    },
    'dm8zvj5x': {
      'en': '8 months ago',
      'fr': '',
    },
    '153ihrsu': {
      'en': 'Removal of inactive Admin zand CS',
      'fr': '',
    },
    '0j6bff8h': {
      'en':
          'Aenean eget lorem libero. In commodo, nulla et faucibus pharetra, urna nunc venenatis sapien.',
      'fr': '',
    },
    'ix3gq1qg': {
      'en': '1 week ago',
      'fr': '',
    },
    'skyckb4l': {
      'en': 'Removal of inactive Admin zand CS',
      'fr': '',
    },
    '69fhg6jq': {
      'en':
          'Aenean eget lorem libero. In commodo, nulla et faucibus pharetra, urna nunc venenatis sapien.',
      'fr': '',
    },
    'vdwgby99': {
      'en': '1 week ago',
      'fr': '',
    },
    '2csatc0f': {
      'en': 'Removal of inactive Admin zand CS',
      'fr': '',
    },
    '85owyklr': {
      'en':
          'Aenean eget lorem libero. In commodo, nulla et faucibus pharetra, urna nunc venenatis sapien.',
      'fr': '',
    },
    '9gvq5zmq': {
      'en': '1 week ago',
      'fr': '',
    },
    'ttn99nlx': {
      'en': 'Home',
      'fr': '',
    },
  },
  // AchievementReport
  {
    'swbl55jc': {
      'en': 'Achievement Report',
      'fr': '',
    },
    'ntm2drw3': {
      'en': 'LOW CARD',
      'fr': '',
    },
    'qn9kwn6b': {
      'en': 'Game Played: ',
      'fr': '',
    },
    '70xzcqfz': {
      'en': '0',
      'fr': '',
    },
    'xfqln4wr': {
      'en': 'Level: ',
      'fr': '',
    },
    'smux120f': {
      'en': '(',
      'fr': '',
    },
    'mywtmw40': {
      'en': '0',
      'fr': '',
    },
    'tqzt2yqh': {
      'en': '/',
      'fr': '',
    },
    'xyp7649d': {
      'en': '5',
      'fr': '',
    },
    '8f33uf14': {
      'en': ')',
      'fr': '',
    },
    'kk7sn741': {
      'en': 'CRICKET',
      'fr': '',
    },
    'b2fqpver': {
      'en': 'Game Played: ',
      'fr': '',
    },
    'edw16f4v': {
      'en': '0',
      'fr': '',
    },
    '8ga57ha8': {
      'en': 'Level: ',
      'fr': '',
    },
    'l3e7pv7b': {
      'en': '(',
      'fr': '',
    },
    '498ob7a5': {
      'en': '0',
      'fr': '',
    },
    'l4mr7rje': {
      'en': '/',
      'fr': '',
    },
    'fih5jxx6': {
      'en': '5',
      'fr': '',
    },
    'm8ml11fs': {
      'en': ')',
      'fr': '',
    },
    'e2c4asxc': {
      'en': 'TEENPATTI',
      'fr': '',
    },
    'ljvtnufm': {
      'en': 'Game Played: ',
      'fr': '',
    },
    'qn4k8q3y': {
      'en': '0',
      'fr': '',
    },
    'd5g05gg7': {
      'en': 'Level: ',
      'fr': '',
    },
    '1mplja4j': {
      'en': '(',
      'fr': '',
    },
    '2hm6u25y': {
      'en': '0',
      'fr': '',
    },
    '0da7ndm7': {
      'en': '/',
      'fr': '',
    },
    'nlnyeu1a': {
      'en': '5',
      'fr': '',
    },
    'tks5d8nj': {
      'en': ')',
      'fr': '',
    },
    'rp38akgr': {
      'en': 'GUESS_ PLAY',
      'fr': '',
    },
    'tabnwmky': {
      'en': 'Game Played: ',
      'fr': '',
    },
    'elgp6795': {
      'en': '0',
      'fr': '',
    },
    'r1rn5xav': {
      'en': 'Level: ',
      'fr': '',
    },
    'b26hiomw': {
      'en': '(',
      'fr': '',
    },
    'fg7z2ujm': {
      'en': '0',
      'fr': '',
    },
    'eg8odz75': {
      'en': '/',
      'fr': '',
    },
    'dlqpd38b': {
      'en': '5',
      'fr': '',
    },
    '4de7lii6': {
      'en': ')',
      'fr': '',
    },
    '1hmp5o9t': {
      'en': 'Home',
      'fr': '',
    },
  },
  // WorldMiggy
  {
    '95kwq3j8': {
      'en': 'Miggy World',
      'fr': '',
    },
    'xtw96q41': {
      'en': 'Merchants',
      'fr': '',
    },
    'higxj267': {
      'en': 'Mentors',
      'fr': '',
    },
    'rx16a933': {
      'en': 'Commands',
      'fr': '',
    },
    'y1wmdaou': {
      'en': 'Rewards',
      'fr': '',
    },
    'gc5t5ucw': {
      'en': 'Home',
      'fr': '',
    },
  },
  // commands
  {
    '6ttvty9h': {
      'en': 'Commands',
      'fr': '',
    },
    'j39t9jm5': {
      'en': '/agree',
      'fr': '',
    },
    '14apvjks': {
      'en': 'Self: ',
      'fr': '',
    },
    'h8luzb9d': {
      'en': 'bidur_ apologizes',
      'fr': '',
    },
    'o2gjsza4': {
      'en': 'With: ',
      'fr': '',
    },
    'eceaivgy': {
      'en': 'bidur_ apologizes to ',
      'fr': '',
    },
    '2gtpiann': {
      'en': ':user',
      'fr': '',
    },
    'n1mp0azi': {
      'en': '/apoloigze',
      'fr': '',
    },
    'sfy47w4f': {
      'en': 'Self: ',
      'fr': '',
    },
    'qni06w2q': {
      'en': 'bidur_ apologizes',
      'fr': '',
    },
    'm87bcx9i': {
      'en': 'With: ',
      'fr': '',
    },
    '3y0eyeib': {
      'en': 'bidur_ apologizes to ',
      'fr': '',
    },
    'zextlg3v': {
      'en': ':user',
      'fr': '',
    },
    '54xi3u7n': {
      'en': '/argh',
      'fr': '',
    },
    'j7j86hut': {
      'en': 'Self: ',
      'fr': '',
    },
    '0xj8suvr': {
      'en': 'bidur_ screams loudly in frustration ',
      'fr': '',
    },
    'rsc8c42k': {
      'en': 'With: ',
      'fr': '',
    },
    'qlrs4u62': {
      'en': 'bidur_ is frustrated with ',
      'fr': '',
    },
    '3vwslh5k': {
      'en': ':user. ',
      'fr': '',
    },
    'vudbi8v6': {
      'en': '\nARGHH!!',
      'fr': '',
    },
    'xjp7ch0i': {
      'en': '/bark',
      'fr': '',
    },
    '8chckwp1': {
      'en': 'Self: ',
      'fr': '',
    },
    'hrn6sn7k': {
      'en': 'bidur_ barks playfully. ',
      'fr': '',
    },
    '37noaadt': {
      'en': 'Ruff ruff',
      'fr': '',
    },
    'dykf0kyh': {
      'en': 'With: ',
      'fr': '',
    },
    '8lo5u75d': {
      'en': 'bidur_ barks playfully at ',
      'fr': '',
    },
    'q8bgs5h4': {
      'en': ':user',
      'fr': '',
    },
    'ealank5t': {
      'en': '/bearhug',
      'fr': '',
    },
    'tqj6hmpq': {
      'en': 'Self: ',
      'fr': '',
    },
    'cfw6l5dp': {
      'en': 'bidur_ is getting ready to bearhug.',
      'fr': '',
    },
    'tusrak82': {
      'en': 'With: ',
      'fr': '',
    },
    'aob0us44': {
      'en': 'bidur_ gives ',
      'fr': '',
    },
    '1bsqm95f': {
      'en': ':user ',
      'fr': '',
    },
    '14g42vw0': {
      'en': 'a great, big, bone-crushing bearhug!',
      'fr': '',
    },
    'rbfqdza0': {
      'en': '/beg',
      'fr': '',
    },
    't316gwei': {
      'en': 'Self: ',
      'fr': '',
    },
    '3kyqirr5': {
      'en': 'bidur_ begs like a dog',
      'fr': '',
    },
    's99ud8qu': {
      'en': 'With: ',
      'fr': '',
    },
    'sm8l24rf': {
      'en': 'bidur_ begs at ',
      'fr': '',
    },
    'ugof2ax2': {
      'en': ':users ',
      'fr': '',
    },
    'htuyn2h6': {
      'en': 'feet',
      'fr': '',
    },
    '0sl95r4t': {
      'en': '/beer',
      'fr': '',
    },
    'hmm1vh6b': {
      'en': 'Self: ',
      'fr': '',
    },
    'lvoj5s6a': {
      'en': 'bidur_ yells \"I AM THIRSTYYYY\"',
      'fr': '',
    },
    '7rn3p75a': {
      'en': 'With: ',
      'fr': '',
    },
    '9mpgtkz5': {
      'en': 'bidur_ begs at ',
      'fr': '',
    },
    '680d0im2': {
      'en': ':users ',
      'fr': '',
    },
    '3deto47g': {
      'en': 'feet',
      'fr': '',
    },
    '1qdwshnk': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Rewards
  {
    '8xg4i0l4': {
      'en': 'Commands',
      'fr': '',
    },
    '5sjrj9um': {
      'en': '/agree',
      'fr': '',
    },
    'rwa56iyl': {
      'en': 'Self: ',
      'fr': '',
    },
    'by618q0v': {
      'en': 'bidur_ apologizes',
      'fr': '',
    },
    '510sqeoj': {
      'en': 'With: ',
      'fr': '',
    },
    'sapii4bk': {
      'en': 'bidur_ apologizes to ',
      'fr': '',
    },
    'aipqtcqc': {
      'en': ':user',
      'fr': '',
    },
    's8py3vid': {
      'en': '/apoloigze',
      'fr': '',
    },
    'vhh3crqt': {
      'en': 'Self: ',
      'fr': '',
    },
    'qvjee8pb': {
      'en': 'bidur_ apologizes',
      'fr': '',
    },
    'c3vgsag1': {
      'en': 'With: ',
      'fr': '',
    },
    '967xngop': {
      'en': 'bidur_ apologizes to ',
      'fr': '',
    },
    'xudk6ubm': {
      'en': ':user',
      'fr': '',
    },
    '1fiofmvy': {
      'en': '/argh',
      'fr': '',
    },
    'kzokwmu1': {
      'en': 'Self: ',
      'fr': '',
    },
    '5k0lwk4u': {
      'en': 'bidur_ screams loudly in frustration ',
      'fr': '',
    },
    'szj6fsmp': {
      'en': 'With: ',
      'fr': '',
    },
    '6ffwxj24': {
      'en': 'bidur_ is frustrated with ',
      'fr': '',
    },
    'gyucgefy': {
      'en': ':user. ',
      'fr': '',
    },
    '6j0a1rl4': {
      'en': '\nARGHH!!',
      'fr': '',
    },
    '43ob7xvr': {
      'en': '/bark',
      'fr': '',
    },
    '2ungfy44': {
      'en': 'Self: ',
      'fr': '',
    },
    'br3ddz2y': {
      'en': 'bidur_ barks playfully. ',
      'fr': '',
    },
    '0rfftnwe': {
      'en': 'Ruff ruff',
      'fr': '',
    },
    'x3qxk0xn': {
      'en': 'With: ',
      'fr': '',
    },
    'begrb7ar': {
      'en': 'bidur_ barks playfully at ',
      'fr': '',
    },
    'vzmbs7wj': {
      'en': ':user',
      'fr': '',
    },
    't68tcssw': {
      'en': '/bearhug',
      'fr': '',
    },
    'o4uye865': {
      'en': 'Self: ',
      'fr': '',
    },
    'wrbuychs': {
      'en': 'bidur_ is getting ready to bearhug.',
      'fr': '',
    },
    'ddmiwb52': {
      'en': 'With: ',
      'fr': '',
    },
    '69nul0c8': {
      'en': 'bidur_ gives ',
      'fr': '',
    },
    'xl0fv56l': {
      'en': ':user ',
      'fr': '',
    },
    'sbhiqed8': {
      'en': 'a great, big, bone-crushing bearhug!',
      'fr': '',
    },
    'z21cdorl': {
      'en': '/beg',
      'fr': '',
    },
    'zmats5eo': {
      'en': 'Self: ',
      'fr': '',
    },
    'xluzixid': {
      'en': 'bidur_ begs like a dog',
      'fr': '',
    },
    'q3icyqmm': {
      'en': 'With: ',
      'fr': '',
    },
    'u6hb9a6e': {
      'en': 'bidur_ begs at ',
      'fr': '',
    },
    'bnimjs2u': {
      'en': ':users ',
      'fr': '',
    },
    'p5as3ex8': {
      'en': 'feet',
      'fr': '',
    },
    '90e36dcq': {
      'en': '/beer',
      'fr': '',
    },
    'c509gb0e': {
      'en': 'Self: ',
      'fr': '',
    },
    'dkibt3a1': {
      'en': 'bidur_ yells \"I AM THIRSTYYYY\"',
      'fr': '',
    },
    'z3fbbhzm': {
      'en': 'With: ',
      'fr': '',
    },
    'no40c8v5': {
      'en': 'bidur_ begs at ',
      'fr': '',
    },
    'bmdo21ts': {
      'en': ':users ',
      'fr': '',
    },
    'e9ubt7d7': {
      'en': 'feet',
      'fr': '',
    },
    'oxzafvpo': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Leaderboards
  {
    'ujhjp44z': {
      'en': 'Leaderboards',
      'fr': '',
    },
    'ddx8lx3o': {
      'en': 'MIGGY EARN CONTEST NOW EVERY WEEK (Last week) !',
      'fr': '',
    },
    '76y0qyh1': {
      'en':
          'Donec eget tincidunt tortor, vitae ornare orci. Vestibulum vitae purus vel augue aliquam rutrat nisid vestibulum turpis. Donec feugia',
      'fr': '',
    },
    'gydi1txh': {
      'en': 'TOP CREDIT SPENDERS LAST WEEK',
      'fr': '',
    },
    '82cdg0xh': {
      'en':
          'Phasellus non congue ex. Morbi eu sem ac ipsum nec posuere. Donec in convallis est.',
      'fr': '',
    },
    'b219l15e': {
      'en': 'TEENPATTI WIN',
      'fr': '',
    },
    'jqzoeqi5': {
      'en':
          'Pellentesque a scelerisque mi. Proin a quam quis lorem sollicitudin scelerisque.',
      'fr': '',
    },
    'bk7q9db3': {
      'en': 'TEENPATTI Played',
      'fr': '',
    },
    'hz79egz0': {
      'en':
          'Pellentesque a scelerisque mi. Proin a quam quis lorem sollicitudin scelerisque.',
      'fr': '',
    },
    'cp6gfosq': {
      'en': 'Cricket Win',
      'fr': '',
    },
    'zndd4o4q': {
      'en': 'Praesent tristique elit id dolor fringilla posuere.',
      'fr': '',
    },
    'zt9q6j80': {
      'en': 'Home',
      'fr': '',
    },
  },
  // ReferandEarn
  {
    'n4k5vx5n': {
      'en': 'Refer and Earn',
      'fr': '',
    },
    'r4j4fiv0': {
      'en': 'Phasellus non congue ex. Morbi eu sem ac eget, laoreet quis nibh.',
      'fr': '',
    },
    'vzbs5uqk': {
      'en':
          'Donec eget tincidunt tortor, vitae ornare orci. Vestibulum ve purus verat nisid vestibulum turpis. Donec feugia',
      'fr': '',
    },
    '2evmnna7': {
      'en':
          'Donec eget tincidunt tortor, vitae ornare sid vestibulum turpis. Donec feugia',
      'fr': '',
    },
    'b3v672fn': {
      'en':
          'Donec eget tincidunt tortor, vitae ornare orci. Vestibulum vbulum turpis. Donec feugia',
      'fr': '',
    },
    'kgmwosrj': {
      'en': 'example@email.com',
      'fr': '',
    },
    'ccguha7l': {
      'en': 'Send Invitation',
      'fr': '',
    },
    '0b137hdk': {
      'en': 'Invite Histories',
      'fr': '',
    },
    'arn8qhkb': {
      'en': 'Home',
      'fr': '',
    },
  },
  // helpsupport
  {
    '33ycfk7k': {
      'en': 'Help & Support',
      'fr': '',
    },
    'cd1k4wgm': {
      'en': 'Miggy',
      'fr': '',
    },
    'q3y1ufnu': {
      'en': 'Live since 2020',
      'fr': '',
    },
    'mknjg0kq': {
      'en': '(managed by the Miggy team)',
      'fr': '',
    },
    'hx5lug72': {
      'en': 'For technical or other issues, contact',
      'fr': '',
    },
    'cipca8j7': {
      'en': 'contact@miggy.co',
      'fr': '',
    },
    'yhegjxny': {
      'en': 'Miggy Issue Report',
      'fr': '',
    },
    '58p2x2mw': {
      'en':
          'Sed orci erat, sagittis id suscipit tortor. Aliquam ac varius felis, ac placerat lorem',
      'fr': '',
    },
    'eppif1sc': {
      'en':
          'Phasellus: non cong. Orbi eu sem ac veliortis vitae vel arcu. Aenean mattis eges',
      'fr': '',
    },
    'zda8dpry': {
      'en': 'Issue Category',
      'fr': '',
    },
    'rzqdjfsa': {
      'en': 'Search...',
      'fr': '',
    },
    '7ajhwgyp': {
      'en': 'Option 1',
      'fr': '',
    },
    'hp68edib': {
      'en': 'Option 2',
      'fr': '',
    },
    'petbminp': {
      'en': 'Option 3',
      'fr': '',
    },
    'bplb1f4x': {
      'en': 'Message',
      'fr': '',
    },
    'vfm0xwnp': {
      'en': 'Image Attachments ',
      'fr': '',
    },
    'zi2qjw6f': {
      'en': 'Submit',
      'fr': '',
    },
    'kxkz42ad': {
      'en': 'Home',
      'fr': '',
    },
  },
  // StoreEmote
  {
    '4r27b7ok': {
      'en': 'Store Emo',
      'fr': '',
    },
    '5nlvorxk': {
      'en': 'Super Emoji Pack',
      'fr': '',
    },
    'd9szxkp0': {
      'en': 'No. of Emo: 28',
      'fr': '',
    },
    '568vioue': {
      'en': 'RC 10000.99',
      'fr': '',
    },
    'v8ozw1fu': {
      'en': 'Buy this Pack',
      'fr': '',
    },
    'dpv9ou3v': {
      'en': 'Super Emoji Pack',
      'fr': '',
    },
    'nwie7bmo': {
      'en': 'No. of Emo: 28',
      'fr': '',
    },
    '4ngz9z5y': {
      'en': 'RC 20000.99',
      'fr': '',
    },
    'zm373euv': {
      'en': 'Buy this Pack',
      'fr': '',
    },
    'aqgoo83n': {
      'en': 'Super Emoji Pack',
      'fr': '',
    },
    '61hngddf': {
      'en': 'No. of Emo: 28',
      'fr': '',
    },
    '7ght5ffe': {
      'en': 'RC 10000.99',
      'fr': '',
    },
    '8bpf45be': {
      'en': 'Buy this Pack',
      'fr': '',
    },
    '8e5f0gww': {
      'en': 'Super Emoji Pack',
      'fr': '',
    },
    'qdjnirxt': {
      'en': 'No. of Emo: 28',
      'fr': '',
    },
    's6fvb3ve': {
      'en': 'RC 10000.99',
      'fr': '',
    },
    'j9k1ivp9': {
      'en': 'Buy this Pack',
      'fr': '',
    },
    'obdecth7': {
      'en': 'Super Emoji Pack',
      'fr': '',
    },
    'sq64r9aa': {
      'en': 'No. of Emo: 28',
      'fr': '',
    },
    'hfcuberr': {
      'en': 'RC 10000.99',
      'fr': '',
    },
    'gekrnomk': {
      'en': 'Buy this Pack',
      'fr': '',
    },
    'w0gazraw': {
      'en': 'Home',
      'fr': '',
    },
  },
  // GiftsStore
  {
    '6t3pam1b': {
      'en': 'Gifts Store',
      'fr': '',
    },
    '5ymusnyp': {
      'en': 'Search Gifts',
      'fr': '',
    },
    'b85o0kqa': {
      'en': 'Search Results',
      'fr': '',
    },
    'feolwoq8': {
      'en': 'Home',
      'fr': '',
    },
  },
  // BeMerchant
  {
    'tsjakmm1': {
      'en': 'Be a Merchant',
      'fr': '',
    },
    'jkw9sct4': {
      'en': 'Merchant Center',
      'fr': '',
    },
    '9dr29hx4': {
      'en': 'Available Mentors',
      'fr': '',
    },
    'ugvvd29k': {
      'en': 'ardi',
      'fr': '',
    },
    'tyxxj184': {
      'en': '21',
      'fr': '',
    },
    'xrivks15': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    'jggynkeh': {
      'en': 'sufly4n',
      'fr': '',
    },
    'xxjvwf1s': {
      'en': '63',
      'fr': '',
    },
    'buq5fcuv': {
      'en': 'Lv 1, Nepal',
      'fr': '',
    },
    'vezdg3b6': {
      'en': 'karvi',
      'fr': '',
    },
    'ph0z2lgy': {
      'en': '29',
      'fr': '',
    },
    '3b6er9gc': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    'ntlviokz': {
      'en': 'pakistan',
      'fr': '',
    },
    'kvzzl3pr': {
      'en': '37',
      'fr': '',
    },
    'idgc1ku2': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    's00t5p16': {
      'en': 'pakistan',
      'fr': '',
    },
    'gqnvxmih': {
      'en': '37',
      'fr': '',
    },
    'p4whwcur': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    'mx79cu5h': {
      'en': 'pakistan',
      'fr': '',
    },
    'hvb9x2na': {
      'en': '37',
      'fr': '',
    },
    'vnvmzt5z': {
      'en': 'Lv 21, Indonesia',
      'fr': '',
    },
    '2914jb54': {
      'en': 'Become a merchant',
      'fr': '',
    },
    '4icp7p0q': {
      'en': 'Home',
      'fr': '',
    },
  },
  // SignUp
  {
    'w4csh0ho': {
      'en': 'Account Information',
      'fr': '',
    },
    'jco59ivz': {
      'en': 'Username',
      'fr': '',
    },
    'q4e29agu': {
      'en': 'Password',
      'fr': '',
    },
    'tjqercky': {
      'en': 'Confirm Password',
      'fr': '',
    },
    '7c1ro2n4': {
      'en': 'Personal Information',
      'fr': '',
    },
    '2qv2o0ej': {
      'en': 'Name',
      'fr': '',
    },
    'zg9dolkd': {
      'en': 'Email',
      'fr': '',
    },
    'd2b268la': {
      'en': 'Gender',
      'fr': '',
    },
    'e6tyk84a': {
      'en': 'Male',
      'fr': '',
    },
    'k8o2lecz': {
      'en': 'Female',
      'fr': '',
    },
    'jwx93w8m': {
      'en': 'Others',
      'fr': '',
    },
    'z6k8w7rd': {
      'en': 'Country',
      'fr': '',
    },
    'o70wavvv': {
      'en': 'Select...',
      'fr': '',
    },
    'js6u4mp4': {
      'en': 'Search...',
      'fr': '',
    },
    'he3d7tte': {
      'en': 'Nigeria',
      'fr': '',
    },
    'cjuvderc': {
      'en': 'United States',
      'fr': '',
    },
    'jbknf1jk': {
      'en': 'India',
      'fr': '',
    },
    'nnp127st': {
      'en': 'China',
      'fr': '',
    },
    '33i0d08d': {
      'en': 'United Kingdom',
      'fr': '',
    },
    'wtt0q6ci': {
      'en': 'Canada',
      'fr': '',
    },
    'efggv2ts': {
      'en': 'Nepal',
      'fr': '',
    },
    'wz7qp463': {
      'en': 'NEXT',
      'fr': '',
    },
    'blkjiwvf': {
      'en': 'Already have an account? ',
      'fr': '',
    },
    '3j6p2tsx': {
      'en': 'Sign in',
      'fr': '',
    },
    'id9of6es': {
      'en': 'Home',
      'fr': '',
    },
  },
  // VerifyPage
  {
    '6xhrhv52': {
      'en': 'VERIFICATION CODE',
      'fr': '',
    },
    '8769cuyb': {
      'en':
          'Cras vestibulum tortor non dui imperdiet, eget imperdiet eros hendrerit. Integer suscipit quam id volutpat mollis.',
      'fr': '',
    },
    'o5blh390': {
      'en': 'Verify',
      'fr': '',
    },
    'n0w1agz8': {
      'en': 'Home',
      'fr': '',
    },
  },
  // ForgotPassword
  {
    'ou865lx9': {
      'en': 'Reset Password',
      'fr': '',
    },
    '10my82ek': {
      'en': 'Username',
      'fr': '',
    },
    'sc4vr2vp': {
      'en': 'Email',
      'fr': '',
    },
    'hpziin57': {
      'en': 'Security Question?',
      'fr': '',
    },
    'vgyq8yoq': {
      'en': 'Security Question?',
      'fr': '',
    },
    'lvw53evw': {
      'en': 'Search...',
      'fr': '',
    },
    'kp7p8ebw': {
      'en': 'What\'s your favourite colour',
      'fr': '',
    },
    'wfvd3eae': {
      'en': 'What\'s the name of your first pet?',
      'fr': '',
    },
    'pztfo475': {
      'en': 'In which city were you born?',
      'fr': '',
    },
    'dxjc4c1q': {
      'en': 'What\'s your mother\'s maiden name?',
      'fr': '',
    },
    'ed9wtzhp': {
      'en': 'What\'s the name of your favorite book?',
      'fr': '',
    },
    'e6o6ynps': {
      'en': 'Answer',
      'fr': '',
    },
    'pl9a297o': {
      'en': 'SEND',
      'fr': '',
    },
    '0lr6hh5z': {
      'en': 'Home',
      'fr': '',
    },
  },
  // InterestPage
  {
    'p5r0gjmw': {
      'en': 'Choose your interests',
      'fr': '',
    },
    'w1ppk3i9': {
      'en': 'Cricket',
      'fr': '',
    },
    'yy6d1197': {
      'en': 'Ludo',
      'fr': '',
    },
    '6cgjam3b': {
      'en': 'Soccer',
      'fr': '',
    },
    'l0hnfd9f': {
      'en': 'Tenis',
      'fr': '',
    },
    'beu9dzhs': {
      'en': 'Chess',
      'fr': '',
    },
    'njgkon0i': {
      'en': 'Volleyball',
      'fr': '',
    },
    'wag3z6w0': {
      'en': 'BasketBall',
      'fr': '',
    },
    '8wnn4ycf': {
      'en': 'NEXT',
      'fr': '',
    },
    'mk5ncvqv': {
      'en': 'Home',
      'fr': '',
    },
  },
  // SignIn
  {
    'tp5fewwo': {
      'en': 'Choose Language',
      'fr': '',
    },
    'crjmkl8p': {
      'en': 'Search...',
      'fr': '',
    },
    'c4wvspll': {
      'en': 'English',
      'fr': '',
    },
    '77l6lq5w': {
      'en': 'French',
      'fr': '',
    },
    'uoaroxk9': {
      'en': 'Portugese',
      'fr': '',
    },
    'a1v6sbjy': {
      'en': 'German',
      'fr': '',
    },
    'cyvxaqd7': {
      'en': 'Chinese',
      'fr': '',
    },
    'gbfynl5z': {
      'en': 'email',
      'fr': '',
    },
    'aizc1cg8': {
      'en': 'Password',
      'fr': '',
    },
    'yel1fhch': {
      'en': 'Remember Me',
      'fr': '',
    },
    'armv5tel': {
      'en': 'Auto Login',
      'fr': '',
    },
    '175wgs8t': {
      'en': 'LOGIN',
      'fr': '',
    },
    'gdgv1980': {
      'en': 'Don\'t have an account? ',
      'fr': '',
    },
    'hobcwj7f': {
      'en': 'Sign Up',
      'fr': '',
    },
    'frwl08zd': {
      'en': 'Forgot your password?',
      'fr': '',
    },
    'd06ai7fi': {
      'en': 'Home',
      'fr': '',
    },
  },
  // TestPage
  {
    'yl0z5a27': {
      'en': 'Received 300 credits on registration.',
      'fr': '',
    },
    'qtvtkozp': {
      'en': '2025-03-25, 07:03 AM',
      'fr': '',
    },
    'pgb36ga5': {
      'en': '+300.0',
      'fr': '',
    },
    '7ez9iukp': {
      'en': 'Sent 300 credits to deporededs',
      'fr': '',
    },
    '9qtf9l8s': {
      'en': '2025-03-25, 07:03 AM',
      'fr': '',
    },
    'm9nhy5ys': {
      'en': '-300.0',
      'fr': '',
    },
    '07b6dxxl': {
      'en': 'Page Title',
      'fr': '',
    },
    'i95aqef7': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Game
  {
    'bcq3zsrd': {
      'en': 'Welcome to the Jackpot Game room',
      'fr': '',
    },
    'f3rwqmbz': {
      'en': 'This room is managed by Miggy',
      'fr': '',
    },
    '8jd1q3u4': {
      'en': 'You currently Joined this room',
      'fr': '',
    },
    'nxanl9bp': {
      'en': 'START GAME: Default',
      'fr': '',
    },
    '8g3hhxkc': {
      'en': 'Reset',
      'fr': '',
    },
    'hlu55cj5': {
      'en': '+100',
      'fr': '',
    },
    'y2y6bmts': {
      'en': '+1K',
      'fr': '',
    },
    'm83nau3c': {
      'en': '+5k',
      'fr': '',
    },
    'dqcho1ee': {
      'en': '+50k',
      'fr': '',
    },
    'u4gubtrw': {
      'en': 'Aa...',
      'fr': '',
    },
    'tkuzd3m5': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Chat
  {
    'o66e8ltw': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu.',
      'fr': '',
    },
    'qcsg1cpp': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu, bibendum tellus. Suspendisse volutpat, diam sit amet euismod semper, velit lorem scelerisque magna, nec faucibus velit elit ac eros',
      'fr': '',
    },
    'o6c2hzi7': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu, bibendum tellus. Suspendisse volutpat, diam sit amet euismod semper.',
      'fr': '',
    },
    'ov5ruefq': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu, bibendum tellus. Suspendisse volutpat, diam sit amet euismod semper.',
      'fr': '',
    },
    'eqwqr11x': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu, bibendum tellus. Suspendisse volutpat, diam sit amet euismod semper.',
      'fr': '',
    },
    '2treax7j': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu, bibendum tellus. Suspendisse volutpat, diam sit amet euismod semper, velit lorem scelerisque magna,',
      'fr': '',
    },
    'ofypfcno': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu, bibendum tellus. Suspendisse volutpat, diam sit amet euismod semper, velit lorem scelerisque magna,',
      'fr': '',
    },
    'yvngac59': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu, bibendum tellus. Suspendisse volutpat, diam sit amet euismod semper, velit lorem scelerisque magna,',
      'fr': '',
    },
    '6lnpcwe3': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu, bibendum tellus. Suspendisse volutpat, diam sit amet euismod semper, velit lorem scelerisque magna,',
      'fr': '',
    },
    'w5t4da8f': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu, bibendum tellus. Suspendisse volutpat, diam sit amet euismod semper, velit lorem scelerisque magna,',
      'fr': '',
    },
    'sna2ga0c': {
      'en':
          'Fusce fringilla velit et congue imperdiet. Nunc vitae justo bibendum, lobortis odio eu, bibendum tellus. Suspendisse volutpat, diam sit amet euismod semper, velit lorem scelerisque magna,',
      'fr': '',
    },
    'qd7mgrq7': {
      'en': 'Aa...',
      'fr': '',
    },
    '8pf1cjih': {
      'en': 'Page Title',
      'fr': '',
    },
    '0x6gz91l': {
      'en': 'Home',
      'fr': '',
    },
  },
  // profileView
  {
    'mi2mybg6': {
      'en': 'Pending Request',
      'fr': '',
    },
    'kgur9gyk': {
      'en': 'A friend',
      'fr': '',
    },
    'tdq1ovqf': {
      'en': 'Add Friend',
      'fr': '',
    },
    'wizplds0': {
      'en': 'Footprints',
      'fr': '',
    },
    'pleofquy': {
      'en': 'Footprints',
      'fr': '',
    },
    'i299sj4o': {
      'en': 'Footprints',
      'fr': '',
    },
    'z98snmx0': {
      'en': 'Statistics',
      'fr': '',
    },
    'apdd03z6': {
      'en': '0',
      'fr': '',
    },
    'i13e3zi7': {
      'en': 'Likes',
      'fr': '',
    },
    '7yblqku8': {
      'en': '3',
      'fr': '',
    },
    'ro9f5y9q': {
      'en': 'Footprints',
      'fr': '',
    },
    '6l3gpr1k': {
      'en': '1',
      'fr': '',
    },
    't73u79il': {
      'en': 'Friends',
      'fr': '',
    },
    'ane18osc': {
      'en': 'Chatrooms',
      'fr': '',
    },
    '0wxa1qmm': {
      'en': 'Followers',
      'fr': '',
    },
    'i40qtzlu': {
      'en': 'Following',
      'fr': '',
    },
    'lnhglbwc': {
      'en': '0',
      'fr': '',
    },
    'k5ntpd3w': {
      'en': 'Gifts Sent',
      'fr': '',
    },
    'fsvlc4e4': {
      'en': '163',
      'fr': '',
    },
    'c40biri6': {
      'en': 'Gifts Re..',
      'fr': '',
    },
    '4n8452vp': {
      'en': 'Additional Options',
      'fr': '',
    },
    'weuxaa1u': {
      'en': 'Transfer Credits',
      'fr': '',
    },
    '9ktulksd': {
      'en': 'Send Email',
      'fr': '',
    },
    '5vm06g93': {
      'en': 'Recent Post',
      'fr': '',
    },
    'vyk297bk': {
      'en': 'Home',
      'fr': '',
    },
  },
  // PostDetails
  {
    'd367s4w4': {
      'en': 'Comments',
      'fr': '',
    },
    '6wakn9ux': {
      'en': 'Write your comment...',
      'fr': '',
    },
    'gpfgd9pq': {
      'en': 'Home',
      'fr': '',
    },
  },
  // jibefkr
  {
    'cz00nax3': {
      'en': '+100',
      'fr': '',
    },
    'g185rcxk': {
      'en': '+500',
      'fr': '',
    },
    'v3lsf43g': {
      'en': '+1k ',
      'fr': '',
    },
    'ehxvbjla': {
      'en': '+5k ',
      'fr': '',
    },
    'fq89lal2': {
      'en': '+50k',
      'fr': '',
    },
    '2dmj1f2e': {
      'en': 'Page Title',
      'fr': '',
    },
    '5weaigkc': {
      'en': 'Home',
      'fr': '',
    },
  },
  // ChatOption
  {
    'uwcf24qv': {
      'en': 'Room Info',
      'fr': '',
    },
    'rjut5bio': {
      'en': 'Check Balance',
      'fr': '',
    },
    '89fnt7qk': {
      'en': 'Block User',
      'fr': '',
    },
    'l9xtoayb': {
      'en': 'Kick User',
      'fr': '',
    },
    '1y55l7xr': {
      'en': 'Private Chat',
      'fr': '',
    },
    'a6d16jtp': {
      'en': 'Participants',
      'fr': '',
    },
    '969pfp4k': {
      'en': 'Leave Chatroom',
      'fr': '',
    },
  },
  // messages
  {
    'okmf0nkt': {
      'en': 'JB',
      'fr': '',
    },
  },
  // roomInfo
  {
    'wz9d8umg': {
      'en': 'Room Info',
      'fr': '',
    },
    'dopbb1g5': {
      'en': 'Check Balance',
      'fr': '',
    },
    'bqcq4mtu': {
      'en': 'Block User',
      'fr': '',
    },
    'tza2o2gk': {
      'en': 'Kick User',
      'fr': '',
    },
    'zb5qz1wl': {
      'en': 'Private Chat',
      'fr': '',
    },
    'botmztf5': {
      'en': 'Participants',
      'fr': '',
    },
    '8fvjelvj': {
      'en': 'Leave Chatroom',
      'fr': '',
    },
  },
  // Post
  {
    'gzewxtz0': {
      'en': 'No Reactions',
      'fr': '',
    },
    '5v1l0w5j': {
      'en': 'Like',
      'fr': '',
    },
    '8bd576wj': {
      'en': 'Comment',
      'fr': '',
    },
    'h4bh5sfy': {
      'en': 'Share',
      'fr': '',
    },
  },
  // ChatRoomInfo
  {
    '7s9pt1v1': {
      'en': 'Profile',
      'fr': '',
    },
    'jviwgk99': {
      'en': 'Transfer Credits',
      'fr': '',
    },
    'iw95rehp': {
      'en': 'Username',
      'fr': '',
    },
    'fcfk50ef': {
      'en': 'Block',
      'fr': '',
    },
    'sr7zxg84': {
      'en': 'Close Chat',
      'fr': '',
    },
  },
  // comment
  {
    '7g2pluep': {
      'en': 'Like',
      'fr': '',
    },
  },
  // PostCreate
  {
    'fw3wa13t': {
      'en': 'Write...',
      'fr': '',
    },
    '4uhr6bcq': {
      'en': 'POST',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    '5v6yul1m': {
      'en': 'Done',
      'fr': '',
    },
    'mm8qzbh8': {
      'en': 'Search',
      'fr': '',
    },
    'tu6udat1': {
      'en': 'TextField',
      'fr': '',
    },
    'lyx6bfxn': {
      'en': '',
      'fr': '',
    },
    'n4l0j22t': {
      'en': '',
      'fr': '',
    },
    '68hzpl5m': {
      'en': '',
      'fr': '',
    },
    'x8srnjlr': {
      'en': '',
      'fr': '',
    },
    'w3jaywip': {
      'en': '',
      'fr': '',
    },
    'e5jy3b6v': {
      'en': '',
      'fr': '',
    },
    'p79974fp': {
      'en': '',
      'fr': '',
    },
    'ch30e3q5': {
      'en': '',
      'fr': '',
    },
    'f6pfdnu5': {
      'en': '',
      'fr': '',
    },
    't4d5qwhg': {
      'en': '',
      'fr': '',
    },
    'o824ibvr': {
      'en': '',
      'fr': '',
    },
    'tfnkvaxz': {
      'en': '',
      'fr': '',
    },
    'r6dlkdcs': {
      'en': '',
      'fr': '',
    },
    't4vmsh6p': {
      'en': '',
      'fr': '',
    },
    'coo4rj2v': {
      'en': '',
      'fr': '',
    },
    'b2gekqb0': {
      'en': '',
      'fr': '',
    },
    '80twm4ob': {
      'en': '',
      'fr': '',
    },
    '6kmys5xv': {
      'en': '',
      'fr': '',
    },
    'xnajof67': {
      'en': '',
      'fr': '',
    },
    '7ds769to': {
      'en': '',
      'fr': '',
    },
    'o2jv9n44': {
      'en': '',
      'fr': '',
    },
    'ohunj24x': {
      'en': '',
      'fr': '',
    },
    'jjbgysit': {
      'en': '',
      'fr': '',
    },
    'mv5qyvyv': {
      'en': '',
      'fr': '',
    },
    'hsz7abbx': {
      'en': '',
      'fr': '',
    },
    'rusfc330': {
      'en': '',
      'fr': '',
    },
    'u30cz4dg': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
