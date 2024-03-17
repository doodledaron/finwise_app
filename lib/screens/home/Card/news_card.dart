import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';
import 'package:vhack_finwise_app/screens/home/ui/news_screen_card.dart';

class news_card extends StatefulWidget {
  final List<New> newss; // Pass articles list from parent widget
  news_card({required this.newss}); // Constructor to receive articles

  @override
  State<news_card> createState() => _news_cardState();
}

class _news_cardState extends State<news_card> {
  late final PageController _pageController;
  List<New> newsdata = NewDatabase.newss;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (_, index) {
              final newss = widget.newss[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => news_screen(news: widget.newss[index]),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 6.0,
                  ),
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjust width as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newss.title, // Access title property directly
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '${newss.date.year}-${newss.date.month}-${newss.date.day}',
                        style: TextStyle(fontSize: 11.0, color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'By ${newss.author}',
                            style: TextStyle(fontSize: 11.0, color: Colors.grey),
                          ),
                          IconButton(
                            icon: Icon(
                              newss.isBookMarked // Use isBookMarked from newss directly
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: newss.isBookMarked ? Colors.blue : null,
                            ),
                            onPressed: () {
                              setState(() {
                                newss.isBookMarked = !newss.isBookMarked;
                              });
                              // You may want to save the updated bookmark status here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: widget.newss.length,
            physics: PageScrollPhysics(), // Enable smooth scrolling
          ),
        ),
      ],
    );
  }
}
