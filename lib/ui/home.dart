import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:online_shop/ui/sign_in.dart';
import 'package:online_shop/ui/sign_up.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueGrey,
                Colors.greenAccent,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'Online Shop',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 40,
                  fontFamily: "Akronim",
                  color: Colors.white60,
                ),
              )),
              SizedBox(
                height: 170,
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SignIn()));
                },
                child: Text(
                  'Hisoga kirish',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 46,
                      color: Colors.white60,
                      fontFamily: "Akronim"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUP()));
                },
                child: Text(
                  "Ruyhaddan o'tish",
                  style: TextStyle(
                      fontFamily: "Akronim",
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                      color: Colors.white60),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Dasturni tugatish',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                    color: Colors.white60,
                    fontFamily: "Akronim"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
