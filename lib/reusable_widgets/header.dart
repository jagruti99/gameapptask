import 'package:flutter/material.dart';
import 'package:game_project/themes.dart';

class Header extends StatelessWidget {
  final String headerText;

  const Header({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            headerText.toUpperCase(),
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.08,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 90.0, right: 90),
          child: Divider(
            height: 5,
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
