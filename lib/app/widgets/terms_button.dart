import 'package:allo_urgence_pro/app/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/app_colors.dart';

class TermsButton extends StatelessWidget {
  const TermsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.to(
                  () => const TermsAndConditions(),
                  fullscreenDialog: true,
                );
              },
              child: RichText(
                text: TextSpan(
                  text: "Lire les ",
                  children: [
                    TextSpan(
                      text: "Termes & Conditions d'utilisation",
                      style: theme.textTheme.titleSmall
                          ?.copyWith(color: AppColors.red),
                    ),
                  ],
                  style: theme.textTheme.titleSmall,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
