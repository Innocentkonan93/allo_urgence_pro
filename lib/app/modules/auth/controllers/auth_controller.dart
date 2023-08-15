import 'package:allo_urgence_pro/app/data/repositories/urgence/urgence_repository.dart';
import 'package:allo_urgence_pro/app/modules/auth/models/urgence_model.dart';
import 'package:allo_urgence_pro/app/modules/profil/controllers/profil_controller.dart';
import 'package:allo_urgence_pro/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  UrgenceRepository urgenceRepository = UrgenceRepository();
  final isAuthProcessing = false.obs;
  final errorMessage = "".obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  Future<void> signInUrgence() async {
    isAuthProcessing(true);

    try {
      //login user with firebase auth
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      // user created Succesfully
      User? user = userCredential.user;

      if (user != null) {
        Get.offAllNamed(Routes.HOME);
      }

      isAuthProcessing(false);
    } on FirebaseAuthException catch (e) {
      isAuthProcessing(false);

      switch (e.code) {
        case "invalid-email":
          // errorMessage = "Your email address appears to be malformed.";
          errorMessage.value = "Adresse e-mail incorrect.";
          break;
        case "wrong-password":
          errorMessage.value = "Mot de passe incorrect.";
          // errorMessage.value = "Your password is wrong.";
          break;

        case "user-not-found":
          errorMessage.value = "Aucun utilisateur existant.";
          // errorMessage.value = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage.value = "Utilisateur désactivé.";
          // errorMessage.value = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage.value = "Trop de tentatives, réessayez plus tard.";
          // errorMessage.value = "Too many requests. Try again later.";
          break;
        case "operation-not-allowed":
          errorMessage.value = "Compte désactivé";
          // errorMessage.value = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage.value = "Une erreur inconnue.";
        // errorMessage = "An undefined Error happened.";
      }

      Get.closeCurrentSnackbar();

      showSnackbar("Erreur", errorMessage.value, Colors.red);
    }
  }

  // register a new user
  Future<void> signUpUrgence() async {
    isAuthProcessing(true);
    // final deviceToken = await _messaging.getToken();

    try {
      // create User with firebase auth
      if (kDebugMode) {
        print('create user');
      }
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      if (userCredential.user != null) {
        User? user = userCredential.user;

        UrgenceModel urgence = UrgenceModel(
          idUrgentiste: user!.uid,
          emailUrgentiste: user.email,
        );
        await urgenceRepository.createUrgence(urgence).then((value) {
          print(value);
          if (value != null) {
            Get.put(ProfilController());
            Get.offAllNamed(Routes.PROFIL);
          }
        });
      }
      isAuthProcessing(false);
      //
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          // errorMessage = "Your email address appears to be malformed.";
          errorMessage.value = "Adresse e-mail incorrect.";
          break;
        case "weak-password":
          errorMessage.value = "Mot de passe trop court";
          break;
        case "email-already-in-use":
          errorMessage.value = "l'e-mail existe déjà";
          // errorMessage.value = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage.value = "Trop de tentatives, réessayez plus tard.";
          // errorMessage.value = "Too many requests. Try again later.";
          break;
        case "operation-not-allowed":
          errorMessage.value = "Connexion avec adresse email désactivée";
          // errorMessage.value = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage.value = "Une erreur inconnue.";
        // errorMessage = "An undefined Error happened.";
      }
      if (kDebugMode) {
        print(e);
      }
      isAuthProcessing(false);
      Get.closeCurrentSnackbar();
      showSnackbar("Erreur", errorMessage.value, Colors.red);
    }
  }

  void showSnackbar(String title, String message, Color color) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      duration: const Duration(seconds: 5),
      animationDuration: const Duration(milliseconds: 400),
    );
  }

  // @override
  // void onReady() {
  //   super.onInit();
    
  // }

  void checkUser() {
    _auth.authStateChanges().listen((event) {
      if (event != null) {
        Get.offAllNamed(Routes.HOME);
      }
    });
  }
}
