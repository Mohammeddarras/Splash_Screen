import 'package:eco_app/config/size_config.dart';
import 'package:flutter/material.dart';

class ScreenBody extends StatefulWidget {
  @override
  _ScreenBodyState createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {

  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                  child: PageView.builder(
                      onPageChanged: (value){
                        setState(() {
                          currentPage = value;
                        });
                      },
                    itemCount: splashData.length,
                    itemBuilder: (context , index) => StaticBody(
                      img: splashData[index]["image"],
                      text: splashData[index]["text"],
                    ),
                  ),
              ),

              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionalWidth(20),
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
  Container buildDot(int index){
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xFFFF7643) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class StaticBody extends StatelessWidget {

  StaticBody({this.text, this.img});
  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Spacer(),

        Text('My shop', style: TextStyle(
          color: Color(0xFFFF7643),
          fontWeight: FontWeight.bold,
          fontSize:getProportionalWidth(36),
        ),),

        Text(text,
          textAlign: TextAlign.center,
        ),

        Spacer(),

        Image.asset(
          img,
          height: getProportionalHeight(265),
          width: getProportionalWidth(235),
        ),
      ],
    );
  }
}

