import 'package:allo_urgence_pro/app/modules/auth/views/register_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../configs/app_colors.dart';
import '../../../widgets/logo_widget.dart';
import '../../../widgets/terms_button.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body:  SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                const SizedBox(height: 60),
                Text(
                  "Bienvenue",
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  "S'inscrire pour commencer",
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const RegisterView());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Créer un compte",
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                    color: AppColors.red,
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Accéder",
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const TermsButton(),
    );
  }
}
