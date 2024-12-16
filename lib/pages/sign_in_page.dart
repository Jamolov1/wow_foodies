import 'package:flutter/material.dart';

import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  void login(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
        return HomePage();
      }));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.78,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                          "assets/img_1.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text("Wow Foodies",
                                          style: TextStyle(
                                              color: Colors.orangeAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.03)),
                                      Text(
                                        "Best Food Delivery app",
                                        style: TextStyle(color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                                  child: Center(
                                                    child: Text(
                                                      "Email",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(width: 1,color: Colors.orange),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                    child: Center(
                                                      child: Text(
                                                        "Phone No.",
                                                        style: TextStyle(
                                                          color: Colors.orange,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Email",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1,color: Colors.grey),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(child: TextFormField(
                                            validator: (email) => email!.contains("@")
                                                ? null
                                                : "Emailda @ belgisi yuq",
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter your email"
                                            ),
                                          ),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Password",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1,color: Colors.grey),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(child: TextFormField(
                                            validator: (password) => password!.length >= 8
                                                ? null
                                                : "kamida 8ta belgidan kam bulmasligi kerak",
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Password"
                                            ),
                                          ),),
                                        ),
                                      ),


                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "I accept the terms & Condition",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: (){
                                            login();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.orangeAccent,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18),),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.grey),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: AssetImage("assets/google.png"),)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1,color: Colors.grey),
                                  image: DecorationImage(image: AssetImage("assets/apple.png"))
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.grey),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: AssetImage("assets/facebook.png"))
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
