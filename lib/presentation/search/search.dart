import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/courses/courses.dart';
import 'package:cyber_bee/presentation/user/single_course/screens/front_course_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends SearchDelegate<String> {
  Search()
      : super(
          searchFieldStyle: MyTextStyles.h4,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: MyColors.iconPrimaryGreyColor,
          ),
        );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query='';
        },
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
    List<QueryDocumentSnapshot> result = [];
    return StreamBuilder(
      stream: GetAllCourseDetails.getCourses(),
      builder: (context, snapshot) {
        result = [];
        if (snapshot.data == null) {
          return const SizedBox.shrink();
        }
        for (QueryDocumentSnapshot e in snapshot.data!.docs) {
          if (e.id.contains(query)) {
            result.add(e);
          }
        }
        if (result.isEmpty) {
          return Center(
            child: Text(
              'There is no course containing $query',
              style: MyTextStyles.h3,
            ),
          );
        }
        return ListView.builder(
          itemCount: result.length,
          itemBuilder: (BuildContext context, int index) {
            final QueryDocumentSnapshot data = result[index];
            return ListTile(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseViewScreen(course: data),
                ),
              ),
              title: Text(
                data.id,
                style: MyTextStyles.h5.copyWith(
                  color: MyColors.iconSecondarywhiteColor.withOpacity(.7),
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: FaIcon(
                  FontAwesomeIcons.book,
                  color: MyColors.iconSecondarywhiteColor.withOpacity(.7),
                  size: 25,
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<QueryDocumentSnapshot> result = [];
    return StreamBuilder(
      stream: GetAllCourseDetails.getCourses(),
      builder: (context, snapshot) {
        result = [];
        if (snapshot.data == null) {
          return const SizedBox.shrink();
        }
        for (QueryDocumentSnapshot e in snapshot.data!.docs) {
          if (e.id.contains(query)) {
            result.add(e);
          }
        }
        result = result.toSet().toList();
        if (result.isEmpty) {
          return Center(
            child: Text(
              'There is no course containing $query',
              style: MyTextStyles.h3,
            ),
          );
        }
        return ListView.builder(
          itemCount: result.length,
          itemBuilder: (BuildContext context, int index) {
            final DocumentSnapshot data = result[index];
            return ListTile(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseViewScreen(course: data),
                ),
              ),
              title: Text(
                data.id,
                style: MyTextStyles.h5.copyWith(
                  color: MyColors.iconSecondarywhiteColor.withOpacity(.7),
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: FaIcon(
                  FontAwesomeIcons.book,
                  color: MyColors.iconSecondarywhiteColor.withOpacity(.7),
                  size: 25,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
