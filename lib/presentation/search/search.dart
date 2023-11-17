import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/core/firebase/courses/courses.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          scaffoldBackgroundColor: MyColors.backgroundBlackColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: MyColors.iconPrimaryGreyColor,
          ),
        );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query == '',
        icon: const FaIcon(FontAwesomeIcons.xmark),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const FaIcon(FontAwesomeIcons.arrowLeft),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
      stream: GetAllCourseDetails.getCourses(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data?.docs.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            Container(
              width: 50,
              height: 30,
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: GetAllCourseDetails.getCourses(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (BuildContext context, int index) {
            final QueryDocumentSnapshot data = snapshot.data!.docs[index];
            return ListTile(
              title: Text(data.id),
              // leading: ,
            );
          },
        );
      },
    );
  }
}
