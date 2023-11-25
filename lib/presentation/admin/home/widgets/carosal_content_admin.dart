import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/presentation/admin/home/event/add_event.dart';
import 'package:cyber_bee/presentation/admin/widgets/add_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentCaroselAdmin extends StatelessWidget {
  const ContentCaroselAdmin({
    super.key,
    required this.showEventsNumber,
    required this.currentIndex, required this.event,
  });

  final int showEventsNumber;
  final ValueNotifier<int> currentIndex;
  final List<QueryDocumentSnapshot> event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: showEventsNumber + 1,
        itemBuilder: (context, index, realIndex) {
          if (index == 0) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEventScreen(),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                  color: MyColors.textWhiteColor.withOpacity(0.4),
                ),
                child: const CutomAddButton(),
              ),
            );
          }

          return InkWell(
            onTap: () => launchUrl(
              Uri.parse(
                event[index-1]['link'],
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: double.infinity,
              height: 100,
              child: ClipRRect(
                borderRadius: circleRad(20),
                child: Image.network(
                   event[index-1]['image'],
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
    );
  }
}
