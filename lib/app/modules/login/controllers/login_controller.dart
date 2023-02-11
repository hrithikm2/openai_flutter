import 'dart:developer';

import 'package:chatgpt/app/data/storage.dart';
import 'package:chatgpt/app/modules/home/views/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    // Once signed in, return the UserCredential
    final user = await FirebaseAuth.instance.signInWithCredential(credential);
    String uid = user.user?.uid ?? "";
    log(uid);
    StorageData.setData('uid', uid);

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'username': user.user?.displayName ?? "USER",
      'email': user.user?.email ?? "dummyemail"
    }).then((value) => Get.to(HomeView()));
    log('jaga');
  }
}
