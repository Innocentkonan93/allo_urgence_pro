// // ignore_for_file: avoid_print

// import 'dart:async';


// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; 
// import '../modules/auth/controllers/auth_controller.dart';

// class AutoComplete extends StatefulWidget {
//   const AutoComplete({Key? key, this.label}) : super(key: key);
//   final String? label;

//   @override
//   State<AutoComplete> createState() => _AutoCompleteState();
// }

// class _AutoCompleteState extends State<AutoComplete> {
//   final _searchTextFieldController = TextEditingController();
//   Timer? _debounce;

//   late GooglePlace googlePlace;
//   List<AutocompletePrediction> predictions = [];
//   @override
//   void initState() {
//     googlePlace = GooglePlace(Constants.PlaceAPIKey);
//     super.initState();
//   }

//   void autoCompleteSearch(String value) async {
//     try {
//       var result = await googlePlace.autocomplete.get(value);
//       if (result != null && result.predictions != null && mounted) {
//         print(result.status);
//         print(result.predictions!.first.description);
//         setState(() {
//           predictions = result.predictions!;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AuthController authController = Get.find<AuthController>();
//     final HomeController homeController = Get.find<HomeController>();
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//             // title: const Text('Votre localisation'),
//             ),
//         body: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.all(15),
//                 decoration: const BoxDecoration(
//                   // color: Colors.white12,
//                   borderRadius: BorderRadius.vertical(
//                     top: Radius.circular(25),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       showCursor: true,
//                       autofocus: true,
//                       cursorColor: Colors.grey,
//                       controller: _searchTextFieldController,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Theme.of(context).colorScheme.surface,
//                         hintText: widget.label ?? "Tapez votre quartier",
//                         hintStyle: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.white60,
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 15),
//                         isDense: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(35),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       style: Theme.of(context).textTheme.bodyText1,
//                       onChanged: (value) {
//                         if (_debounce?.isActive ?? false) _debounce!.cancel();
//                         _debounce = Timer(
//                           const Duration(milliseconds: 700),
//                           () {
//                             if (value.isNotEmpty) {
//                               autoCompleteSearch(value);
//                             } else {
//                               //
//                             }
//                           },
//                         );
//                       },
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     if (widget.label != null &&
//                         widget.label!.contains("Indiquer votre position"))
//                       Obx(() {
//                         if (homeController
//                             .actualCustomerAdresse.value.isEmpty) {
//                           return const SizedBox();
//                         }
//                         return ListTile(
//                           leading: CircleAvatar(
//                             backgroundColor: Theme.of(context)
//                                 .colorScheme
//                                 .secondary
//                                 .withOpacity(.5),
//                             child: const FaIcon(
//                               FontAwesomeIcons.mapPin,
//                               size: 20,
//                               color: AppColor.white,
//                             ),
//                           ),
//                           title: Text(
//                             'Votre position actuelle',
//                             style: Theme.of(context).textTheme.bodyText1,
//                           ),
//                           subtitle: Text(
//                             homeController.actualCustomerAdresse.value,
//                           ),
//                           onTap: () {
//                             Get.back(
//                               result: {
//                                 "adresse":
//                                     homeController.actualCustomerAdresse.value,
//                                 "location": {
//                                   "lat":
//                                       "${homeController.currentLocation.value!.latitude}",
//                                   "lng":
//                                       "${homeController.currentLocation.value!.longitude}",
//                                 }
//                               },
//                             );
//                           },
//                         );
//                       }),
//                     if (predictions.isNotEmpty)
//                       const Divider(
//                         height: .1,
//                       ),
//                     Expanded(
//                       child: ListView.builder(
//                         // shrinkWrap: true,
//                         itemCount: predictions.length,
//                         itemBuilder: (context, index) {
//                           final prediction = predictions[index];
//                           return ListTile(
//                             leading: CircleAvatar(
//                               backgroundColor: Theme.of(context)
//                                   .colorScheme
//                                   .secondary
//                                   .withOpacity(.5),
//                               child: const FaIcon(
//                                 FontAwesomeIcons.mapPin,
//                                 size: 20,
//                                 color: AppColor.white,
//                               ),
//                             ),
//                             title: Text(
//                               prediction.description.toString(),
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline6!
//                                   .copyWith(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                             ),
//                             onTap: () async {
//                               authController
//                                   .adresse(prediction.description.toString());
//                               print(authController.adresse.value);

//                               final placeId = prediction.placeId!;

//                               final details =
//                                   await googlePlace.details.get(placeId);

//                               // if (details != null &&
//                               //     details.result != null &&
//                               //     mounted) {}

//                               // print(details!.result!.geometry!.location!.lat
//                               //     .toString());

//                               if (details == null) return;
//                               Get.back(
//                                 result: {
//                                   "adresse": prediction.description.toString(),
//                                   "location": {
//                                     "lat":
//                                         "${details.result!.geometry!.location!.lat}",
//                                     "lng":
//                                         "${details.result!.geometry!.location!.lng}",
//                                   }
//                                 },
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
