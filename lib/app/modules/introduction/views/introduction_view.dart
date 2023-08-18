import 'package:allo_urgence_pro/app/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/introduction_controller.dart';
import '../models/introduction_model.dart';

class IntroductionView extends GetWidget<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    controller.completedIntro();
                  },
                  child: Text(
                    'Passer',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          extendBodyBehindAppBar: true,
          body: PageView.builder(
            controller: controller.pageController.value,
            itemCount: controller.introductions.length,
            onPageChanged: (index) {
              controller.selectedPageIndex(index);
            },
            itemBuilder: (context, index) {
              IntroductionModel intro = controller.introductions[index];
              return SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: 80,
                      // height: size.height * .35,
                    ),
                    Text(
                      intro.description,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: AppColors.red,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: controller.selectedPageIndex.value == 0
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/${intro.imageName}",
                          // height: size.height * .35,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      controller.completedIntro();
                    },
                    child: const Text("Passer"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: controller.pageController.value,
                        count: controller.introductions.length,
                        onDotClicked: (index) {
                          controller.pageController.value.jumpToPage(index);
                        },
                        effect: WormEffect(
                          activeDotColor: Theme.of(context).colorScheme.primary,
                          dotColor: Colors.grey.withOpacity(.4),
                          dotWidth: 8,
                          dotHeight: 8,
                          spacing: 4,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      if (controller.selectedPageIndex.value < 1) {
                        controller.pageController.value.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.decelerate);
                      } else {
                        controller.completedIntro();
                      }
                    },
                    icon: const Icon(
                      Icons.chevron_right_rounded,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
