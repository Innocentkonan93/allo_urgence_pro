import 'package:allo_urgence_pro/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/app_colors.dart';
import '../../../widgets/logo_widget.dart';
import '../../../widgets/terms_button.dart';

class LoginView extends GetWidget<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Obx(
        () {
          return Scaffold(
            appBar: AppBar(
              surfaceTintColor: AppColors.white,
            ),
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
                        "Connecter",
                        style: theme.textTheme.titleLarge,
                      ),
                      Text(
                        "Se connecter pour commencer",
                        style: theme.textTheme.labelLarge,
                      ),
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ce champ est obligatoire";
                          }
                          if (!value.isEmail) {
                            return "Entrer une adresse correcte";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: controller.passController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Mot de passe",
                          prefixIcon: Icon(Icons.lock_outlined),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          controller.signInUrgence();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: !controller.isAuthProcessing.value,
                              replacement: const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator.adaptive(),
                              ),
                              child: Text(
                                "Se connecter",
                                style: theme.textTheme.titleSmall?.copyWith(
                                  color: AppColors.white,
                                ),
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
        },
      ),
    );
  }
}
