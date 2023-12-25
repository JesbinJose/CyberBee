
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:flutter/material.dart';

class CertificatePart extends StatelessWidget {
  const CertificatePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColors.secondaryGreyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 150,
      child: StreamBuilder(
        stream: UserDetails.getAllCertificate(),
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (snapshot.data == null || snapshot.data!.docs.isEmpty)
                Text(
                  'No certificates obtained till now',
                  style: MyTextStyles.h4,
                ),
              if (snapshot.data == null || snapshot.data!.docs.isEmpty)
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'For Getting certificate compelete A course',
                    style: MyTextStyles.h4,
                  ),
                ),
              if (snapshot.data != null && snapshot.data!.docs.isNotEmpty)
                Container(),
            ],
          );
        },
      ),
    );
  }
}