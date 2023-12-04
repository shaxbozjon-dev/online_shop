import 'package:flutter/material.dart';
import 'package:online_shop/common/database.dart';
import 'package:online_shop/ui/home.dart';
import 'homePage/asosiy.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final phonenumber=TextEditingController();
  final password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.greenAccent,
          child:Column(
            children: [

              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phonenumber,
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(

                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.nest_cam_wired_stand),
                    labelText: "Phonenumber",
                    hintText: "phonenumber",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: password,
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(

                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.nest_cam_wired_stand),
                    labelText: "Password",
                    hintText: "Password",
                  ),
                ),
              ),

FloatingActionButton(  onPressed: () {


  if (      malumotlar.login(phonenumber.text, password.text) ==1) {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Asosiy(),
      ),
    );
  }
  else{
    Navigator.push(context, MaterialPageRoute(builder: (_)=>Home()));
  }

},
  child: const Icon(Icons.text_fields),

)
            ],
          ),
        ),
      ),
    );
  }
}
