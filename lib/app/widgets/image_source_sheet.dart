import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  const ImageSourceSheet({
    super.key,
    this.title,
    this.isImage = false,
  });
  final String? title;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? 'Modifier votre photo',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Get.back(result: ImageSource.camera);
                      },
                      icon: const Icon(Icons.camera_alt),
                      style: IconButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        side: const BorderSide(
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Get.back(result: ImageSource.gallery);
                      },
                      icon: const Icon(
                        Icons.photo_size_select_actual,
                      ),
                      style: IconButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        side: const BorderSide(
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  if (isImage == false)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          Get.back(result: "doc");
                        },
                        icon: const Icon(
                          Icons.document_scanner_rounded,
                        ),
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          side: const BorderSide(
                            width: .5,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
