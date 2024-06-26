import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vhack_finwise_app/data/infos.dart';
import 'package:vhack_finwise_app/data/users.dart';
import 'package:vhack_finwise_app/model/info.dart';
import 'package:vhack_finwise_app/screens/bottom_nav_bar/my_bottom_nav_bar.dart';
import 'package:vhack_finwise_app/screens/home/ui/widgets/Card/info_card.dart';

import 'package:vhack_finwise_app/screens/home/ui/widgets/Card/choice_card.dart';

import 'package:vhack_finwise_app/screens/home/ui/widgets/Card/article_card.dart';

import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';
import 'package:vhack_finwise_app/screens/home/ui/widgets/Card/news_card.dart';

import 'package:vhack_finwise_app/model/quiz.dart';
import 'package:vhack_finwise_app/data/quizz.dart';
import 'package:vhack_finwise_app/screens/home/ui/widgets/Card/quiz_card.dart';
import 'package:vhack_finwise_app/screens/home/ui/widgets/Card/quiz_card_true_false.dart';

import 'package:vhack_finwise_app/screens/home/ui/new_more_screen.dart';
import 'package:vhack_finwise_app/screens/home/ui/search_screen.dart';

import 'package:vhack_finwise_app/utils/global_variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key); // Fix the super constructor

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = UserDatabase.users[0].username;
  final List<News> newss =
      NewDatabase.newss; // Access articles from data source
  final List<info> infoss = InfoDatabase.infos;
  final List<Quiz> quizz = QuizDatabase.quizz;
  // Map<String, Map<String, bool>> isQuizAnswered = {
  //   'true or false': {
  //     'Quiz 1': false,
  //     'Quiz 2': false,
  //     'Quiz 3': false,
  //   },
  //   'options': {
  //     'Quiz 1': false,
  //     'Quiz 2': false,
  //     'Quiz 3': false,
  //     'Quiz 4': false,
  //     'Quiz 5': false,
  //     'Quiz 6': false,
  //   }
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          'FinWise',
          style: TextStyle(
              color: GlobalVariables.tertiaryColor,
              fontFamily: GlobalVariables.finwiseFont().fontFamily),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Hi $name',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  'WHAT YOU',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: GlobalVariables.titleFont().fontFamily),
                ),
                const SizedBox(height: 3),
                Text(
                  'INTERESTED TODAY ?',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: GlobalVariables.titleFont().fontFamily,
                  ),
                ),
                const SizedBox(height: 10),
                GlobalOrLocalSelection(), // Assuming you have this widget defined elsewhere
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text(
                      'Trending',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GlobalVariables.titleFont().fontFamily),
                    ),
                    Spacer(),
                    TextButton(
                      child: Text(
                        'More',
                        style: TextStyle(fontSize: 14.0, color: Colors.blue),
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NewsMoreScreen(more_screen_newss: newss),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200, // Adjust the height as needed
                  child: NewsCard(newss: newss),
                ),

                SizedBox(
                  height: 250, // Adjust the height as needed
                  child: InfoCard(infoss: infoss),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Articles',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 140, // Adjust the height as needed
                  child: ArticleCard(news: newss[1]),
                ),
                SizedBox(
                  height: 140, // Adjust the height as needed
                  child: ArticleCard(news: newss[2]),
                ),
                SizedBox(
                  height: 140, // Adjust the height as needed
                  child: ArticleCard(news: newss[3]),
                ),
                SizedBox(
                  height: 140, // Adjust the height as needed
                  child: ArticleCard(news: newss[4]),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Learn &',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            fontFamily: GlobalVariables.titleFont().fontFamily,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '       Earn Points  ',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            fontFamily: GlobalVariables.titleFont().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CarouselSlider(
                  items: [
                    Center(
                      child: QuizCard(
                        quizz: QuizDatabase.quizz[0],
                      ),
                    ),
                    Center(
                      child: QuizCard(
                        quizz: QuizDatabase.quizz[1],
                      ),
                    ),
                    Center(
                      child: QuizCard(
                        quizz: QuizDatabase.quizz[2],
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlayInterval: const Duration(seconds: 3),
                    enableInfiniteScroll: false,
                    height: 520, // Adjust height as needed
                    viewportFraction:
                        1.0, // Make each item occupy the entire screen width
                    autoPlay: true, // Auto scroll carousel
                    aspectRatio: 16 / 9, // Aspect ratio of carousel items
                    enlargeCenterPage: true, // Enlarge the center item
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "You don't just stop there :)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                CarouselSlider(
                  items: [
                    Center(
                      child: QuizTrueFalseCard(
                        quizz: QuizDatabase.quizz[3],
                      ),
                    ),
                    Center(
                      child: QuizTrueFalseCard(
                        quizz: QuizDatabase.quizz[4],
                      ),
                    ),
                    Center(
                      child: QuizTrueFalseCard(
                        quizz: QuizDatabase.quizz[5],
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlayInterval: const Duration(seconds: 4),
                    enableInfiniteScroll: false,
                    height: 250, // Adjust height as needed
                    viewportFraction:
                        1.0, // Make each item occupy the entire screen width
                    autoPlay: true, // Auto scroll carousel
                    aspectRatio: 16 / 9, // Aspect ratio of carousel items
                    enlargeCenterPage: true, // Enlarge the center item
                  ),
                ),
                SizedBox(height: 20),
                CarouselSlider(
                  items: [
                    Center(
                      child: QuizTrueFalseCard(
                        quizz: QuizDatabase.quizz[6],
                      ),
                    ),
                    Center(
                      child: QuizTrueFalseCard(
                        quizz: QuizDatabase.quizz[7],
                      ),
                    ),
                    Center(
                      child: QuizTrueFalseCard(
                        quizz: QuizDatabase.quizz[8],
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlayInterval: const Duration(seconds: 3),
                    enableInfiniteScroll: false,
                    height: 250, // Adjust height as needed
                    viewportFraction:
                        1.0, // Make each item occupy the entire screen width
                    autoPlay: true, // Auto scroll carousel
                    aspectRatio: 16 / 9, // Aspect ratio of carousel items
                    enlargeCenterPage: true, // Enlarge the center item
                  ),
                ),
                SizedBox(height: 20),
              ]),
        ),
      ),
    );
  }
}
