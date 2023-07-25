import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDB {
  final firestore = FirebaseFirestore.instance;

  Future<bool> setUserDocument() async {
    User user = await UserApi.instance.me();
    final name = user.kakaoAccount?.profile?.nickname;
    final imageUrl = user.kakaoAccount?.profile?.profileImageUrl;
    final email = user.kakaoAccount?.email;

    DocumentReference doc =
        firestore.collection("user").doc(user.id.toString());

    DocumentSnapshot check = await doc.get();
    if (check.exists) {
      // update
      doc.update({
        "name": name,
        "email": email,
        "imageUrl": imageUrl,
        "last_login": DateTime.now().toString(),
      });
    } else {
      // create
      doc.set({
        "name": name,
        "email": email,
        "imageUrl": imageUrl,
        "last_login": DateTime.now().toString(),
        "first_login": DateTime.now().toString(),
      });
    }

    return true;
  }
}
