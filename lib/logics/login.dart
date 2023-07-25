import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin {
  Future<bool> isLogined() async {
    // 기존 토큰 존재 여부 확인
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

  Future<bool> login() async {
    try {
      if (await isKakaoTalkInstalled()) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return checkEmail();
        } catch (error) {
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return checkEmail();
        } catch (error) {
          return false;
        }
      }
    } catch (error) {
      return false;
    }
  }

  Future<bool> checkEmail() async {
    User user = await UserApi.instance.me();

    List<String> scopes = [];
    if (user.kakaoAccount?.emailNeedsAgreement == true) {
      scopes.add("account_email");
    }

    if (scopes.isNotEmpty) {
      try {
        await UserApi.instance.loginWithNewScopes(scopes);
        return true;
      } catch (err) {
        return false;
      }
    }
    return true;
  }

  Future logout() async {
    try {
      await UserApi.instance.logout();
      return true;
    } catch (error) {
      return false;
    }
  }
}
