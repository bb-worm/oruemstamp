import 'package:flutter/material.dart';

import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:oruemstamp/pages/login.dart';
import 'package:oruemstamp/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: 'assets/config/.env');
  KakaoSdk.init(nativeAppKey: dotenv.env['NATIVE_APP_KEY']);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> isLoggedIn() async {
    if (!await AuthApi.instance.hasToken()) {
      return false;
    }

    // 토큰 유효성 체크
    try {
      await UserApi.instance.accessTokenInfo();
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Oruem Stamp",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: isLoggedIn(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return HomePage();
            } else {
              return LoginPage();
            }
          }),
      routes: {
        "/home": (_) => HomePage(),
        "/login": (_) => LoginPage(),
      },
    );
  }
}
