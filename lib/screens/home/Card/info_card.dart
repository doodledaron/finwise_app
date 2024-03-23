import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vhack_finwise_app/model/info.dart';
import 'package:vhack_finwise_app/data/infos.dart';

class InfoCard extends StatefulWidget {
  final List<info> infoss; // Pass articles list from parent widget
  InfoCard({required this.infoss}); // Constructor to receive articles

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  int _currentPage = 0;
  late final PageController _pageController;

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
        Expanded(
          // Wrap SizedBox with Expanded
          child: SizedBox(
            height: 240,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (_, index) {
                final info = widget.infoss[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 0.0),
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjust width as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.blue[500],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          info.title, // Access title property
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical:
                                10), // Adjust the horizontal padding as needed
                        child: Text(
                          '${info.text}', // Access author property
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: widget.infoss.length,
              physics: PageScrollPhysics(),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.infoss.length,
            (index) => Container(
              margin: EdgeInsets.all(3.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
