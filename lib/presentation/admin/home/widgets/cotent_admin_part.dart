import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/events/events.dart';
import 'package:cyber_bee/presentation/admin/home/widgets/carosal_content_admin.dart';
import 'package:flutter/material.dart';

class AdminEventCarosal extends StatelessWidget {
  AdminEventCarosal({
    super.key,
  });

  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: StreamBuilder(
        stream: MyFirebaseEvents.getAllEvents(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text('No Events present'),
            );
          }
          final int eventsNumber = snapshot.data!.docs.length;
          final int showEventsNumber = eventsNumber > 10 ? 10 : eventsNumber;
          return Column(
            children: [
              ContentCaroselAdmin(
                showEventsNumber: showEventsNumber,
                currentIndex: currentIndex,
                event: snapshot.data!.docs,
              ),
              k10Height,
              ValueListenableBuilder(
                valueListenable: currentIndex,
                builder: (___, i, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        showEventsNumber + 1,
                        (index) {
                          bool isSelcted = index == i;
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 2,
                            ),
                            height: isSelcted ? 5 : 4,
                            width: isSelcted ? 5 : 4,
                            decoration: BoxDecoration(
                              color:
                                  MyColors.iconSecondarywhiteColor.withOpacity(
                                isSelcted ? 1 : 0.8,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
