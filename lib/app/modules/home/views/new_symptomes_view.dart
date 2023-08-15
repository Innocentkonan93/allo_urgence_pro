import 'package:allo_urgence_pro/app/configs/app_colors.dart';
import 'package:allo_urgence_pro/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSymptomesView extends GetWidget<HomeController> {
  const NewSymptomesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Editer votre profil"),
        ),
        body: Obx(
          () {
            if (controller.currentUrgence.value == null) {
              return const SizedBox();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      "Cas pris en charge",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Maladie",
                        style: theme.textTheme.titleMedium,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Nom de la maladie"),
                    onChanged: (value) {
                      controller.maladie(value);
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "Symptomes",
                        style: theme.textTheme.titleMedium,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          "Séparer par une virgules s'il y en a plusieurs",
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Les symptômes de la maladies",
                    ),
                    minLines: 2,
                    onChanged: (value) {
                      controller.symptomes(value);
                    },
                    maxLines: 50,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      controller.updateUrgence();
                    },
                    child: Visibility(
                      visible: !controller.isSaving.value,
                      replacement: const SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(),
                      ),
                      child: Text(
                        "Enregistrer",
                        style: theme.textTheme.titleSmall
                            ?.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  // ...List.generate(controller.formItems.length, (index) {
                  //   return controller.formItems[index];
                  // }),
                  // IconButton.filledTonal(
                  //   onPressed: () {
                  //     controller.formItems.add(
                  //       TextFormField(
                  //         onChanged: (value) {
                  //           controller.symptomesList.add(value);

                  //           print(controller.symptomesList);
                  //         },
                  //       ),
                  //     );
                  //   },
                  //   icon: const Icon(Icons.add),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
