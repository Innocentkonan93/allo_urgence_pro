import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMessage {
  static void showLoginErrorMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class OtherMessage {
  static void showNewDemandeDialog(context, RxBool isShowing) async {
    isShowing(true);
    Future.delayed(const Duration(seconds: 1), () {
      isShowing(false);
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black87,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            height: Get.size.height * .65,
            width: Get.size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: Theme.of(context).colorScheme.error,
                        ))
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Nouvelle Demande',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                        const Spacer(),
                        Text(
                          'Service',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          'Consultation'.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.green,
                                  ),
                        ),
                        const SizedBox(height: 15),
                        Text('Departement',
                            style: Theme.of(context).textTheme.labelMedium),
                        Text(
                          'Gynécologie'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, necessitatibus!, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, necessitatibus!',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.black54,
                                  ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(minutes: 10),
                        height: 50,
                        width: isShowing.value ? Get.size.width - (30) : 0,
                        child: Container(
                          color: Theme.of(context).colorScheme.onBackground,
                          child: const Center(
                            child: FittedBox(
                              child: Text('Accpeter'),
                            ),
                          ),
                        ),
                        onEnd: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static void showSuccessMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

 
}
