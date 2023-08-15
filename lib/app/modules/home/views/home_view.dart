import 'package:allo_urgence_pro/app/configs/app_colors.dart';
import 'package:allo_urgence_pro/app/modules/home/views/new_symptomes_view.dart';
import 'package:allo_urgence_pro/app/modules/profil/views/profil_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    Get.put(HomeController());
    return Obx(
      () {
        if (controller.currentUrgence.value == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          backgroundColor: theme.primaryColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              controller.currentUrgence.value!.nameUrgentiste ?? "",
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.white,
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: InkWell(
                  onTap: () {
                    Get.to(
                      () => const ProfilView(),
                      duration: const Duration(milliseconds: 700),
                      transition: Transition.fadeIn,
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: "logo",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        controller.currentUrgence.value!.logoUrgentiste ?? "",
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: SizedBox.expand(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        'Dashboard',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on_rounded,
                              color: AppColors.white),
                          const SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              controller.currentUrgence.value!.adresse ?? "",
                              maxLines: 1,
                              style: theme.textTheme.titleSmall
                                  ?.copyWith(color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 18,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Les cas pris en charge",
                                style: theme.textTheme.titleMedium,
                              ),
                              const Spacer(),
                              IconButton.filledTonal(
                                onPressed: () {
                                  Get.to(
                                    () => const NewSymptomesView(),
                                    fullscreenDialog: true,
                                  );
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Visibility(
                              visible: controller.symptomesList.isNotEmpty,
                              replacement: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // const FaIcon(FontAwesomeIcons.kitMedical),
                                    Image.asset("assets/images/medicine.png",
                                        height: 80),
                                    const SizedBox(height: 20),
                                    Text(
                                      "Aucun cas pris en charge enregistré\n Veuillez enregistrer des cas ",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ...controller.symptomesList.entries
                                        .map((e) {
                                      return ListTile(
                                        title: Text(
                                          e.key.toString(),
                                          style: theme.textTheme.titleMedium,
                                        ),
                                        subtitle: Text(
                                          e.value.toString(),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 5),
                                        trailing:
                                            const Icon(Icons.edit_rounded),
                                      );
                                    }).toList()
                                    // ...List.generate(
                                    //   controller.symptomesList.length,
                                    //   (index) {
                                    //     RxMap<dynamic, dynamic> map =
                                    //         controller.symptomesList[index];

                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
