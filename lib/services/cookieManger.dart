// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CookieManager {
  String _cookieKey = 'cookies';

  Future<void> storeCookies(List<Cookie> cookies) async {
    final storage = FlutterSecureStorage();
    final cookieString =
        cookies.map((cookie) => '${cookie.name}=${cookie.value}').join('; ');
    await storage.write(key: _cookieKey, value: cookieString);
  }

//   static Future<List<Cookie>> getCookies() async {
//     final storage = FlutterSecureStorage();
//     final cookieString = storage.read(key:"_cookieKey") ?? '';
//     return cookieString.split('; ').map((cookieStr) {
//       final parts = cookieStr.split('=');
//       return Cookie(parts[0], parts[1]);
//     }).toList();
//   }
// }
}
