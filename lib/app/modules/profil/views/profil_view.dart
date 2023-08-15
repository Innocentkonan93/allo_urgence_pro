import 'package:allo_urgence_pro/app/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    Get.put(ProfilController());
    controller.getUrgenceData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon compte'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: SizedBox.expand(
                                  child: Hero(
                                    tag: "logo",
                                    child: Image.network(
                                      controller.currentUrgence.value
                                              ?.logoUrgentiste ??
                                          "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const FaIcon(
                                            FontAwesomeIcons.houseMedical,
                                            size: 20,
                                            color: AppColors.red),
                                        const SizedBox(width: 5),
                                        Text(
                                          controller.currentUrgence.value!
                                                  .nameUrgentiste ??
                                              "",
                                          style: theme.textTheme.titleLarge,
                                        ),
                                      ],
                                    ),
                                    // const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on_rounded,
                                            color: AppColors.red),
                                        const SizedBox(width: 5),
                                        Flexible(
                                          child: Text(
                                            controller.currentUrgence.value!
                                                    .adresse ??
                                                "",
                                            maxLines: 1,
                                            style: theme.textTheme.titleMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(Icons.phone,
                                            color: AppColors.red),
                                        const SizedBox(width: 5),
                                        Flexible(
                                          child: Text(
                                            controller
                                                .currentUrgence.value!.contacts!
                                                .split(',')
                                                .first,
                                            maxLines: 1,
                                            style: theme.textTheme.titleMedium,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            TextFormField(
                              initialValue: controller
                                  .currentUrgence.value!.emailUrgentiste!
                                  .split(',')
                                  .first,
                              readOnly: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              initialValue:
                                  controller.currentUrgence.value?.contacts ??
                                      "",
                              readOnly: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                labelText: "Second conact",
                              ),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Text(
                                "Enregistrer",
                                style: theme.textTheme.titleSmall
                                    ?.copyWith(color: AppColors.white),
                              ),
                              label: const Icon(
                                Icons.check_rounded,
                                color: AppColors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.logout_rounded),
                    onPressed: () {
                      controller.signOut();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.red.withOpacity(.11),
                    ),
                    label: const Text("Déconnexion"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
