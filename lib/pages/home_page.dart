import 'package:flutter/material.dart';
import 'package:wow_foodies/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int offersIndex = 0;
  PageController _controller = PageController();
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },


        children: [
          Container(
            child: ListView(
              children: [
                ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  title: Text(
                    "Deliver to",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.orange,
                      ),
                      Text("Mangalore"),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_bag_outlined)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          size: 30,
                        ),
                        hintText: "Search Foods Restaurants",
                        hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        suffixIcon: Icon(Icons.mic),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Special Offers",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {
                            },
                            child: Text(
                              "See all",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: PageView(
                            controller: controller,
                            onPageChanged: (int index) {
                              setState(() {
                                offersIndex = index;
                              });
                            },
                            children: [
                              _item_offers(),
                              _item_offers(),
                              _item_offers(),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: buildIndicator(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories ",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return Details();
                              }));
                            },
                            child: Text(
                              "See all",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _item_categories(text: "All", isactive: true),
                      _item_categories(text: "Burgers", isactive: false),
                      _item_categories(text: "Pizza", isactive: false),
                      _item_categories(text: "Hot Dog", isactive: false),
                      _item_categories(text: "Lavash", isactive: false),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  height: MediaQuery.of(context).size.height * 0.19,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      item_popular(),
                      item_popular(),
                      item_popular(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Restaurants near You",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      item_restaurants(),
                      item_restaurants(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories ",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentIndex = index;
              _controller.animateToPage(index,
                  duration: Duration(milliseconds: 100), curve: Curves.easeIn);
            });
          },
          currentIndex: currentIndex,
          fixedColor: Colors.orange,
          unselectedIconTheme: IconThemeData(color: Colors.black),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "home",
            ),
          ]),
    );
  }

  Widget _item_offers({image}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
                "https://static.vecteezy.com/system/resources/previews/036/804/331/non_2x/ai-generated-assorted-indian-food-on-dark-wooden-background-free-photo.jpg"),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _indicator(isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: 10,
      width: isActive ? 30 : 10,
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isActive ? Colors.orange : Colors.grey,
      ),
    );
  }

  List<Widget> buildIndicator() {
    List<Widget> _indicators = [];
    for (int i = 0; i < 3; i++) {
      if (offersIndex == i) {
        _indicators.add(_indicator(true));
      } else {
        _indicators.add(_indicator(false));
      }
    }
    return _indicators;
  }

  Widget _item_categories({text, isactive}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: isactive ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1.5, color: Colors.orange),
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontSize: 20, color: isactive ? Colors.white : Colors.orange),
      )),
    );
  }

  Widget item_popular() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfGsPbMbWYi2MOQxN1hTNCzMnf_WugHIu0oQ&s"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            "Chicken Burger",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.orange,
                size: 18,
              ),
              Text(
                "4.8 (1.2k)",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$5.00",
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.orange,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget item_restaurants() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(
              "https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
