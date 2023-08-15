import 'package:allo_urgence_pro/app/modules/profil/controllers/profil_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationSearch extends GetWidget<ProfilController> {
  const LocationSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(),
          body: Obx(() {
            return SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_on_rounded),
                        hintText: "Localisation",
                      ),
                      onChanged: (query) {
                        controller.placeAutoComplete(query);
                      },
                    ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.navigation_rounded,
                      ),
                      label: Text(
                        "Position actuelle",
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          ...List.generate(controller.placePredications.length,
                              (index) {
                            final String place =
                                controller.placePredications[index];
                            return ListTile(
                              contentPadding: const EdgeInsets.all(4),
                              dense: true,
                              leading: const Icon(Icons.location_on_rounded),
                              title: Text(place),
                              onTap: () {
                                Get.back(result: place);
                              },
                            );
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
