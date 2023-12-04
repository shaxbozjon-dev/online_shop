import 'package:flutter/material.dart';

import '../common/database.dart';
class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final name=TextEditingController();
  final phonenumber=TextEditingController();
  final _password=TextEditingController();
  final locatsion=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: name,
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(

                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.nest_cam_wired_stand),
                    labelText: "Name",
                    hintText: "Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phonenumber,
                  keyboardType:TextInputType.number,
                  decoration: InputDecoration(

                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.nest_cam_wired_stand),
                    labelText: "phone Number",
                    hintText: "phone Number",
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _password,
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(

                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.nest_cam_wired_stand),
                    labelText: "Password",
                    hintText: "Password",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: locatsion,
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(

                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.nest_cam_wired_stand),
                    labelText: "Locatcion",
                    hintText: "Locatcion",
                  ),
                ),
              ),

            ],
          ),
        ),  floatingActionButton: FloatingActionButton(
        onPressed: () {

          Model yangiUser =Model(
            name: name.text,
            phonenumber: phonenumber.text,
            locatcion: locatsion.text,
            password: _password.text, category: [],
          );


          bool isSaved = malumotlar.isContains(yangiUser);
          //bu yerda oldin bunday obyekt yaratilmagan bulsa yaratadi

          name.clear(); //oxirida stekstfieldni tozalayabman
          phonenumber.clear();
          locatsion.clear();
          _password.clear();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  //buttonni bosganda databaseda saqlangan malumotlar kelib chiqadi
                  content: Text(
                    isSaved
                        ? "Muvafaqiyali saqlandi"
                        : "Bunday foydalanuvchi bor ekan",
                    style: const TextStyle(fontSize: 7),
                  ),
                );
              });
        },
        child: const Icon(Icons.text_fields),
      ),
      ),

    );
  }
}
