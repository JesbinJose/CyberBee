import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/events/events.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeEventCarosal extends StatelessWidget {
  HomeEventCarosal({
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
              SizedBox(
                height: 150,
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: showEventsNumber,
                  itemBuilder: (context, index, realIndex) {
                    final QueryDocumentSnapshot event =
                        snapshot.data!.docs[index];
                    return InkWell(
                      onTap: () {
                        try {
                          launchUrl(
                            Uri.parse(
                              event['link'],
                            ),
                          );
                        } catch (e) {
                          mySnakbar(context, e.toString());
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        width: double.infinity,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: circleRad(20),
                          child: Image.network(
                            event['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlayInterval: const Duration(
                      seconds: 6,
                    ),
                    onPageChanged: (index, reason) {
                      currentIndex.value = index;
                    },
                    viewportFraction: 1,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                  ),
                ),
              ),
              k10Height,
              ValueListenableBuilder(
                valueListenable: currentIndex,
                builder: (___, i, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        showEventsNumber,
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
