import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/app_colors.dart';
import '../../../widgets/logo_widget.dart';
import '../../../widgets/terms_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                const SizedBox(height: 60),
                Text(
                  "Créer votre compte",
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  "S'inscrire pour commencer",
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 40),
                const TextField(
                  decoration: InputDecoration(hintText: "Email"),
                ),
                const SizedBox(height: 16),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Mot de passe"),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration:
                      InputDecoration(hintText: "Confirmation mot de passe"),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const TermsButton(),
    );
  }
}
