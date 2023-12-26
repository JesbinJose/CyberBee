import 'package:cyber_bee/application/profile/pick_image.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/constants/regex.dart';
import 'package:cyber_bee/core/firebase/events/events.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/custom_text_form_field.dart';
import 'package:cyber_bee/presentation/admin/home/widgets/coustom_button.dart';
import 'package:cyber_bee/presentation/admin/home/widgets/coustom_image_preview.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEventScreen extends StatelessWidget {
  AddEventScreen({super.key});
  final ValueNotifier<String?> _image = ValueNotifier<String?>(null);
  final TextEditingController _link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event',
          style: MyTextStyles.h4,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImagePreview(image: _image),
            k30Height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextFormField(
                controller: _link,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Event link is important';
                  } else if (!RegExp(validUrl).hasMatch(value)) {
                    return 'Not Valid Url';
                  }
                  return null;
                }, hintText: 'Event url',
              ),
            ),
            k30Height,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButtonAdmin(
                    title: 'Pick image',
                    function: () async {
                      final XFile? file =
                          await PickProfilePicture.pickImage(context);
                      if (file != null) {
                        _image.value = file.path;
                      }
                    },
                  ),
                  k10Width,
                  CustomButtonAdmin(
                    title: 'Add event',
                    function: () async {
                      if (_image.value != null && _image.value!.isNotEmpty) {
                        if (_link.text.isNotEmpty) {
                          await MyFirebaseEvents.addEvent(
                            _image.value!,
                            _link.text,
                            context,
                          ).then(
                            (value) => Navigator.pop(context),
                          );
                        } else {
                          mySnakbar(context, 'Link is empty');
                        }
                      } else {
                        mySnakbar(context, 'There is no Picture selected');
                      }
                    },
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
