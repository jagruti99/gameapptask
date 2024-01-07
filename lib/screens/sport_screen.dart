// ignore_for_file: library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_project/screens/users_list.dart';
import 'package:game_project/model/game_model.dart';
import 'package:game_project/reusable_widgets/header.dart';
import 'package:game_project/themes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'numbercountersection.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  _SportsScreenState createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  //declaration for slider
  int _currentIndex = 0;
  final List<String> sliderimageList = [
    'https://blog.kheloo.com/wp-content/uploads/2023/02/Best-online-casinos-in-india-2023-to-win-real-money-1170x614.jpg',
    'https://blog.kheloo.com/wp-content/uploads/2023/02/Top-5-Recommended-Online-Casinos-in-India.jpg',
    'https://blog.kheloo.com/wp-content/uploads/2024/01/WhatsApp-Image-2024-01-03-at-8.33.31-PM.jpeg',
    'https://blog.kheloo.com/wp-content/uploads/2024/01/WhatsApp-Image-2024-01-03-at-8.33.31-PM-1.jpeg'
  ];

//declaration for language section
  List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Italian',
    'Japanese',
    'Russian'
  ];
  int visibleLanguages = 4;

  bool showMore = false;

  List<Game> games = [
    Game(
        name: 'Game 1',
        image:
            'https://blog.kheloo.com/wp-content/uploads/2023/12/Tips-and-Tricks-on-How-to-Roll-Dice-in-Craps.jpeg',
        minCost: 10,
        maxCost: 100),
    Game(
        name: 'Game 2',
        image:
            'https://blog.kheloo.com/wp-content/uploads/2023/09/Card-Games-1170x614.jpeg',
        minCost: 100,
        maxCost: 100),
    Game(
        name: 'Game 3',
        image:
            'https://blog.kheloo.com/wp-content/uploads/2024/01/sports-game.jpg',
        minCost: 20,
        maxCost: 200),
    Game(
        name: 'Game 4',
        image:
            'https://blog.kheloo.com/wp-content/uploads/2022/12/Online-slots-kheloo.jpeg',
        minCost: 100,
        maxCost: 100),
    Game(
        name: 'Game 5',
        image:
            'https://blog.kheloo.com/wp-content/uploads/2023/12/Tips-and-Tricks-on-How-to-Roll-Dice-in-Craps.jpeg',
        minCost: 10,
        maxCost: 100),
    Game(
        name: 'Game 6',
        image:
            'https://blog.kheloo.com/wp-content/uploads/2024/01/sports-game.jpg',
        minCost: 20,
        maxCost: 200),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //slider section
            CarouselSlider(
              items: sliderimageList.map((url) {
                return Container(
                  margin: const EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 250.0,
                autoPlay: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),

            const SizedBox(height: 5),
            //dash indicator section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(sliderimageList.length, (index) {
                  return Container(
                    width: 30.0,
                    height: 4.0,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? AppColors.secondaryColor
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            //language header section
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                border: Border(
                  top: BorderSide(
                    color: AppColors.secondaryColor,
                    width: 3.0,
                  ),
                  bottom: BorderSide(
                    color: AppColors.secondaryColor,
                    width: 3.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  for (int i = 0; i < visibleLanguages; i++)
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          languages[i],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(color: AppColors.textColor),
                        ),
                      ),
                    ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        _showLanguageDialog(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("...",
                            style: TextStyle(color: AppColors.textColor)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Header(headerText: "Jackpot"),
            //number counter section
            const NumberCounter(),

            const SizedBox(height: 20),
            const Header(headerText: "Live Withdrawal"),
            const SizedBox(height: 20),
            //userlist section
            const UsersListSection(),

            const SizedBox(height: 20),
            //video section
            YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: 'DApLfGbIW5g',
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              ),
            ),
            const SizedBox(height: 20),
            //games header
            const Header(headerText: 'Games'),
            const SizedBox(height: 20),
            //games section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Most Popular (${games.length})',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showMore = !showMore;
                          });
                        },
                        child: Text(
                          showMore ? 'Show Less' : 'Show More',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: showMore ? games.length : 4,
              itemBuilder: (context, index) {
                Game game = games[index];

                return Card(
                  elevation: 2.0,
                  color: AppColors.accentColor,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: AppColors.secondaryColor, width: 1),
                    borderRadius: BorderRadius.circular(6.0), //<-- SEE HERE
                  ),
                  margin: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(6.0)),
                          child: Image.network(
                            game.image,
                            fit: BoxFit.fill,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return const Text('Image failed to load');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Min.',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: '₹',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.secondaryColor,
                                            fontSize: 16)),
                                    TextSpan(
                                        text: '${game.minCost}',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                color: AppColors.secondaryColor,
                                thickness: 1,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Max.',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: '₹',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.secondaryColor,
                                            fontSize: 16)),
                                    TextSpan(
                                        text: '${game.maxCost}k',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a Language'),
          content: Column(
            children: [
              for (int i = 0; i < languages.length; i++)
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(languages[i]),
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
