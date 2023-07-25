import 'package:flutter/material.dart';

import 'package:oruemstamp/logics/login.dart';
import '../logics/db.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final kakaoLogin = KakaoLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("로그인"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    if (await kakaoLogin.login()) {
                      await FireStoreDB().setUserDocument();

                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, "/home");
                    }
                  },
                  iconSize: 200,
                  icon: const Image(
                    image: AssetImage("assets/kakao_login_medium_narrow.png"),
                    fit: BoxFit.contain,
                  )),
              ElevatedButton(
                onPressed: () async {
                  await kakaoLogin.logout();
                },
                child: const Text("logout"),
              )
            ],
          ),
        ));
  }
}
