import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: [
            item_all(),
            item_all(),
            item_all(),
            item_all(),
            item_all(),
            item_all(),
            item_all(),
            item_all(),
            item_all(),
            item_all(),
            item_all(),
            item_all(),
          ],
        ),
      ),
    );
  }

  Widget item_all() {
    return Card(
      elevation: 2,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7Z7uvK5fm2fOdR3mVMRxuru203fHSP7-xJQ&s"),
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
