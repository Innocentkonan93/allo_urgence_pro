import 'package:allo_urgence_pro/app/data/repositories/urgence/urgence_repository.dart';
import 'package:allo_urgence_pro/app/modules/auth/models/urgence_model.dart';
import 'package:allo_urgence_pro/app/modules/profil/views/success_viiew.dart';
import 'package:allo_urgence_pro/app/routes/app_pages.dart';
import 'package:allo_urgence_pro/app/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/api_service.dart';
import '../../home/controllers/home_controller.dart';

class ProfilController extends GetxController {
  UrgenceRepository urgenceRepository = UrgenceRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ApiService apiService = ApiService();
  FirebaseService firebaseService = FirebaseService();
  Rxn<UrgenceModel> currentUrgence = Rxn<UrgenceModel>();
  PageController pageController = PageController();
  final ImagePicker imagePicker = ImagePicker();
  final selectedPageIndex = 0.obs;
  final selectedPlace = "Indiquer votre localisation".obs;
  final imagePath = "".obs;
  final isSaving = false.obs;
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  RxList<String> placePredications = <String>[].obs;

  final centerName = "".obs;
  final centerLogo = "".obs;
  final centerContacts = "".obs;

  void placeAutoComplete(String query) async {
    List<String>? response = await apiService.searchPlace(query);
    if (response != null) {
      print(response);
      placePredications(response);
    }
  }

  void getUrgenceData() {
    HomeController homeController = Get.find<HomeController>();
    currentUrgence(homeController.currentUrgence.value);
  }

  Future<String?> pickFile(ImageSource source) async {
    XFile? result = await imagePicker.pickImage(source: source);
    if (result != null) {
      return result.path;
    } else {
      return null;
    }
  }

  void saveProfilData() async {
    isSaving(true);
    try {
      final url = await storeImage();
      User? user = _auth.currentUser;
      UrgenceModel urgence = UrgenceModel(
        idUrgentiste: user?.uid,
        emailUrgentiste: user?.email,
        logoUrgentiste: url,
        adresse: selectedPlace.value,
        contacts: centerContacts.value,
        nameUrgentiste: centerName.value,
        symptomes: "{}",
      );
      print(urgence.toJson());
      final UrgenceModel? urgenceUpdate =
          await urgenceRepository.updateUrgence(urgence);
      if (urgenceUpdate != null) {
        Get.offAll(
          () => const SuccessView(),
        );
      }
      isSaving(false);
    } catch (e) {
      isSaving(false);
      print(e);
    }
  }

  Future<String?> storeImage() async {
    final String id = _auth.currentUser!.uid;
    if (imagePath.isNotEmpty) {
      String url =
          await firebaseService.uploadImage("Images/$id/", imagePath.value);
      return url;
    } else {
      return null;
    }
  }

  void signOut() async {
    await _auth.signOut().then((value) {
      Get.offAllNamed(Routes.AUTH);
    });
  }
}
