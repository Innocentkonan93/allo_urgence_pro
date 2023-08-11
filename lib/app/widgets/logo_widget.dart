
import 'package:flutter/material.dart';

import '../configs/app_colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(color: AppColors.grey),
    );
  }
}
