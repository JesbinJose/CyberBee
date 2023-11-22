import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:cyber_bee/presentation/user/course/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class CourseProgressContainerWidget extends StatelessWidget {
  const CourseProgressContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: MyColors.secondaryGreyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Progress',
            style: MyTextStyles.h4.copyWith(
              fontSize: 18,
            ),
          ),
          k20Height,
          FutureBuilder<double>(
            future: UserDetails.getProgress(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return CustomLinearProgressIndicator(
                  value: snapshot.data!,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
