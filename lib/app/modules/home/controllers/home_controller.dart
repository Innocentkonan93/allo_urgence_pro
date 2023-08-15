import 'dart:convert';

import 'package:allo_urgence_pro/app/configs/app_colors.dart';
import 'package:allo_urgence_pro/app/data/repositories/urgence/urgence_repository.dart';
import 'package:allo_urgence_pro/app/modules/auth/models/urgence_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UrgenceRepository urgenceRepository = UrgenceRepository();
  Rxn<UrgenceModel> currentUrgence = Rxn<UrgenceModel>();

  RxList<Widget> formItems = RxList<Widget>([]);
  RxMap<dynamic, dynamic> symptomesList = {}.obs;

  final maladie = "".obs;
  final symptomes = "".obs;
  final isSaving = false.obs;

  @override
  void onReady() {
    getUrgenceData();
    super.onReady();
  }

  void getUrgenceData() async {
    String id = _auth.currentUser!.uid;
    Future.delayed(const Duration(seconds: 2), () async {
      UrgenceModel? urgence = await urgenceRepository.getUrgence(id);
      if (urgence != null) {
        currentUrgence(urgence);
        symptomesList.addAll(jsonDecode(urgence.symptomes ?? "{}"));
        print(symptomesList);
      }
    });
  }

  void updateUrgence() async {
    isSaving(true);
    Map<String, String> map = {maladie.value: symptomes.value};
    symptomesList.addAll(map);
    print(symptomesList);
    try {
      UrgenceModel urgence = UrgenceModel(
        idUrgentiste: currentUrgence.value?.idUrgentiste,
        emailUrgentiste: currentUrgence.value?.emailUrgentiste,
        logoUrgentiste: currentUrgence.value?.logoUrgentiste,
        adresse: currentUrgence.value?.adresse,
        contacts: currentUrgence.value?.contacts,
        nameUrgentiste: currentUrgence.value?.nameUrgentiste,
        symptomes: symptomesList,
        coordonnees: currentUrgence.value?.coordonnees,
        id: currentUrgence.value?.id,
      );
      print(urgence.toJson());
      final UrgenceModel? urgenceUpdate =
          await urgenceRepository.updateUrgence(urgence);
      if (urgenceUpdate != null) {
        print("updated");
        showDialog(
          context: Get.context!,
          builder: (context) {
            return Dialog(
              backgroundColor: AppColors.red,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle_outline_rounded,
                      size: 70,
                      color: AppColors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Ajouter un autre cas d'uregnce ?",
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                maladie.value = "";
                                Get.back();
                              },
                              child: const Text("Oui"),
                            ),
                            TextButton(
                              onPressed: () {
                                symptomes.value = "";
                                Get.back();
                                Get.back();
                              },
                              child: const Text("Non"),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }
      isSaving(false);
    } catch (e) {
      isSaving(false);
      print(e);
    }
  }
}
