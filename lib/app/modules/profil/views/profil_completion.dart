import 'dart:io';

import 'package:allo_urgence_pro/app/configs/app_colors.dart';
import 'package:allo_urgence_pro/app/modules/profil/controllers/profil_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/image_source_sheet.dart';
import '../../../widgets/location_search.dart';

class ProfilCompletion extends GetWidget<ProfilController> {
  const ProfilCompletion({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Obx(
        () {
          if (controller.currentUrgence.value != null) {
            return const SizedBox();
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Editer votre profil",
                style: theme.textTheme.titleLarge,
              ),
            ),
            body: SizedBox.expand(
              child: Column(
                children: [
                  Text(
                    "Ajouter des information pour créer votre profil",
                    style: theme.textTheme.titleSmall,
                  ),
                  Expanded(
                    child: PageView(
                      controller: controller.pageController,
                      onPageChanged: (value) {
                        controller.selectedPageIndex(value);
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                const Spacer(),
                                InkWell(
                                  onTap: () async {
                                    dynamic source = await showModalBottomSheet(
                                      context: Get.context!,
                                      showDragHandle: true,
                                      builder: (context) {
                                        return const ImageSourceSheet(
                                          title: "Ajouter votre logo",
                                          isImage: true,
                                        );
                                      },
                                    );
                                    if (source != null) {
                                      final path =
                                          await controller.pickFile(source);
                                      if (path != null) {
                                        controller.imagePath(path);
                                      }
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.black12,
                                    ),
                                    child: Center(
                                      child: controller.imagePath.isEmpty
                                          ? const Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.camera_alt),
                                                Text(
                                                  'LOGO',
                                                ),
                                              ],
                                            )
                                          : SizedBox.expand(
                                              child: Image.file(
                                                File(
                                                    controller.imagePath.value),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    Text("Centre de santé",
                                        style: theme.textTheme.labelLarge),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.health_and_safety_outlined),
                                    labelText: "Nom du centre de santé",
                                  ),
                                  onChanged: (value) {
                                    controller.centerName(value);
                                  },
                                ),
                                // TextButton.icon(onPressed: (){}, icon: Icon(Icons.), label: label)
                                const Spacer(flex: 2),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            children: [
                              const Spacer(),
                              Row(
                                children: [
                                  Text("Votre localisation",
                                      style: theme.textTheme.labelLarge),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Obx(
                                () => Container(
                                  // padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: .5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ListTile(
                                    leading:
                                        const Icon(Icons.location_on_rounded),
                                    title: Text(
                                      controller.selectedPlace.value,
                                    ),
                                    onTap: () async {
                                      final place = await Get.to(
                                        () => const LocationSearch(),
                                        fullscreenDialog: true,
                                      );
                                      controller.selectedPlace(place);
                                    },
                                  ),
                                ),
                              ),
                              const Spacer(flex: 2),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Form(
                            key: controller.formKey2,
                            child: Column(
                              children: [
                                const Spacer(),
                                Row(
                                  children: [
                                    Text("Vos contacts",
                                        style: theme.textTheme.labelLarge),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    labelText: "Numéro de téléphone",
                                  ),
                                  maxLength: 10,
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {
                                    controller.centerContacts(value);
                                  },
                                ),
                                const Spacer(flex: 2),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.selectedPageIndex.value == 0) {
                      if (controller.formKey.currentState!.validate()) {
                        controller.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    } else if (controller.selectedPageIndex.value == 1) {
                      if (controller.selectedPlace.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: Text(
                                      "Indiquer votre localisation",
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        controller.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    } else if (controller.selectedPageIndex.value == 2) {
                      if (controller.formKey2.currentState!.validate()) {
                        controller.saveProfilData();
                      }
                    }
                    // controller.signUpUrgence();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: !controller.isSaving.value,
                        replacement: const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        child: Text(
                          controller.selectedPageIndex.value == 2
                              ? "Terminer"
                              : "Continuer",
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
