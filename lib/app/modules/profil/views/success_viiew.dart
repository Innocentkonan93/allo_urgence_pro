import 'package:allo_urgence_pro/app/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profil_controller.dart';

class SuccessView extends GetWidget<ProfilController> {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset("assets/images/success.png"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Féliciations votre profil à bien été créé",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            child: Text(
              "Commencer",
              style: theme.textTheme.titleSmall?.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
