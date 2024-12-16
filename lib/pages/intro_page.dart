import 'package:flutter/material.dart';
import 'package:wow_foodies/pages/register_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0.03,
            right: MediaQuery.of(context).size.height * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.06),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (int index) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
              children: [
                item_intro(
                  image: "assets/intro_images/intro.png",
                  text: "Order Fast",
                  title: "Order your Food",
                  subtitle:
                      "A good meal can turn any day around. Order now for delicous cravings.",
                ),
                item_intro(
                  image: "assets/intro_images/intro_1.png",
                  text: "Easy Payment",
                  title: "Safe Online Payment",
                  subtitle:
                      "As part of a secure payment, your credit/ Dabit card number, expery are encryupted",
                ),
                item_intro(
                  image: "assets/intro_images/intro_2.png",
                  text: "Fast Delivery",
                  title: "Delivery at your Doorstep",
                  subtitle:
                      "We provide door to door service in mean time with best quality of food",
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildIndicator(),
              ),
            ),
            currentIndex == 2
                ? InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                        return RegisterPage();
                      }));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      _controller.animateToPage(currentIndex + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget item_intro({
    image,
    text,
    title,
    subtitle,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.38,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            child: Column(
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 10,
      width: isActive ? 30 : 10,
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  List<Widget> buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
