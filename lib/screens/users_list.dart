import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_project/themes.dart';

import '../model/user_model.dart';

class UsersListSection extends StatefulWidget {
  const UsersListSection({super.key});

  @override
  State<UsersListSection> createState() => _UsersListSectionState();
}

class _UsersListSectionState extends State<UsersListSection> {
  List<User> users = [
    User(name: 'Mehar', cost: 17955, time: 4),
    User(name: 'Anushka', cost: 31920, time: 5),
    User(name: 'Ira', cost: 11970, time: 5),
    User(name: 'Vivaan', cost: 27930, time: 12)
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.accentColor,
          border: Border.all(
            color: AppColors.secondaryColor,
            width: 3.0,
          ),
        ),
        child: GridView.builder(
          itemCount: users.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 3),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            User user = users[index];
            return ListTile(
              leading: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    // border color
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.textColor, width: 3)),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.person_fill,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Row(
                children: [
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      text: TextSpan(
                        text: '${user.name}' ' ',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        children: <TextSpan>[
                          const TextSpan(
                              text: '₹',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryColor,
                                  fontSize: 12)),
                          TextSpan(
                              text: '${user.cost}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Text('${user.time} second ago',
                  style: const TextStyle(color: Colors.white, fontSize: 11)),
            );
          },
        ),
      ),
    );
  }
}
