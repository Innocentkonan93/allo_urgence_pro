import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../controllers/introduction_controller.dart';

class IntroductionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroductionController>(
      () => IntroductionController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
