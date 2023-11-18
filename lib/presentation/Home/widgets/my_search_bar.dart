import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/search/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showSearch(
          context: context,
          delegate: Search(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 50,
        width: MediaQuery.sizeOf(context).width * .9,
        decoration: const BoxDecoration(
          color: MyColors.textWhiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              30,
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              'Search',
              style: MyTextStyles.h4.copyWith(
                color: MyColors.iconPrimaryGreyColor.withOpacity(0.5),
              ),
            ),
            ratioSize(1),
            FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: MyColors.iconPrimaryGreyColor.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
