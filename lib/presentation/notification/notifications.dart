import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
        ),
        body: FutureBuilder(
          future: UserDetails.getAllNotifications(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'There is no Messages',
                  style: MyTextStyles.h4,
                ),
              );
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                final message = snapshot.data![index];
                return ListTile(
                  onTap: () {
                    launchUrl(
                      Uri.parse(
                        message['url'],
                      ),
                    ).then((value) {
                      
                    });

                  },
                  title: Text(
                    message['message']!,
                    style: MyTextStyles.h4,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: snapshot.data!.length,
            );
          },
        ),
      ),
    );
  }
}
