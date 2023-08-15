import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/caches/cache_helper.dart';
import '../../../utils/constants.dart';
import '../../auth/views/auth_view.dart';
import '../models/introduction_model.dart';

class IntroductionController extends GetxController {
  final isIntroductionViewed = false.obs;
  final selectedPageIndex = 0.obs;

  final pageController = PageController().obs;

  List<IntroductionModel> introductions = [
    IntroductionModel(
      name: "Consultation",
      description: "Enregistrer votre \nClinique ou votre \nCentre de Santé",
      imageName: "intro1.png",
    ),
    IntroductionModel(
      name: "Appel visio",
      description: "Définir vos cas \nd’Urgence pris en compte",
      imageName: "intro2.png",
    ),
  ].obs;

  void completedIntro() async {
    isIntroductionViewed(true);
    await CacheHelper.saveData(
      key: ApiConstants.introductionKey,
      value: isIntroductionViewed.value,
    );
    Get.offAll(const AuthView());
  }
}
