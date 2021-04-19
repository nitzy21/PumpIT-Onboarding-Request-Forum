import 'dart:io';
import 'package:flutter/material.dart';
import 'forumModule.dart';
import 'splashScreenData.dart';
import 'requestModule.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFFF3A494) : Colors.pink[100],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return SliderTile(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 70 : 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      pageController.animateToPage(slides.length - 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                    },
                    child: Text('SKIP', style: TextStyle(fontSize: 18),),
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                    },
                    child: Text('NEXT',  style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: Platform.isIOS ? 70 : 60,
              color: const Color(0xFFF3A494),
              child: FlatButton(
                child: Text(
                  'GET STARTED NOW',
                  style: TextStyle(
                    color: Colors.white ,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
//                    MaterialPageRoute(builder: (context) => requestModule()),
                    MaterialPageRoute(builder: (context) => forumModule()),
                  );
                },
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  String imageAssetPath, title, desc;

  SliderTile({this.imageAssetPath, this.desc, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
          SizedBox(height: 10),
          Text(desc, style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
          SizedBox(height: 50),
          Image.asset(imageAssetPath, width: 300.0, height: 300.0),
        ],
      ),
    );
  }
}
