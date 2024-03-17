import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/new.dart';

String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}

class news_screen extends StatefulWidget {
  final New news;
  const news_screen({Key? key, required this.news}) : super(key: key);

  @override
  State<news_screen> createState() => _news_screenState();
}

class _news_screenState extends State<news_screen> {
  late final PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
      backgroundColor: Colors.grey[200], // Set the background color of the body here
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 4),
                  CircleAvatar(
                    backgroundImage: AssetImage('${widget.news.imagePath}'),
                    radius: 9.5,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${widget.news.com}',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      ),
                      Positioned(
                        top: 1.5,
                        left: 1.0,
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 1,
                    height: 14,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  SizedBox(width: 5),
                  Text('5 min Read'),
                  SizedBox(width: 5),
                  Container(
                    width: 1,
                    height: 14,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                  ),  
                  SizedBox(width: 3),
                  Text(
                    getMonthName(widget.news.date.month) +
                        ' ' +
                        '${widget.news.date.day}, ${widget.news.date.year}', // Format date
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
                  ),
            ]
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  '${widget.news.title}',
                  style: TextStyle(fontSize:30.0,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.news.text}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), // Display the specific text (text5 in this case)
              SizedBox(height: 5.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.news.text2}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), 
              SizedBox(height: 5.0),
              Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.0, // Adjust image width as needed
                          height: 50.0, // Adjust image height as needed
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'TO LAZY TO READ ?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              )),
                        ),
                      ],
                    ),
              SizedBox(height: 10.0),
              Container(
                      width: 330.0, // Adjust image width as needed
                      height: 200.0, // Adjust image height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(
                              '${widget.news.imagePath}'), // Use AssetImage for local assets
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(height: 20.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.news.text3}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), 
              SizedBox(height: 20.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.news.text4}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), 
              SizedBox(height: 20.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.news.text5}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ),
              SizedBox(height: 20),
              Divider(), 
            ],
          ),
        ),
    )
    );
  }
}