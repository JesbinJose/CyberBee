import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfPartScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> part;
  const PdfPartScreen({super.key, required this.part});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          part['partName'],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 75.0,
        child: FittedBox(
          child: Center(
            child: FloatingActionButton(
              backgroundColor: MyColors.iconPrimaryGreyColor,
              onPressed: () {
              try {
                launchUrl(
                  Uri.parse(
                    part['url'],
                  ),
                );
              } catch (e) {
                mySnakbar(context, e.toString());
              }
            },
              child: Text(
                ' Get\n PDF',
                style: MyTextStyles.h4,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                part['description'],
                style: MyTextStyles.h4.copyWith(
                  color: Colors.white54,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
