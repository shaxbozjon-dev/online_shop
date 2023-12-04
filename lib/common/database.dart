import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/ui/homePage/asosiy.dart';

import 'model/model.dart';
String Username="";
Model j =Model(category: [],name: "",password: "",locatcion: "");
DataBase malumotlar = DataBase();
class DataBase {

  Map<String, Model> database = {};
  List<MyModel> currencyList = [];
List maxsulotlar=[nimadir(Colors.white, "Olma", "221", "img/images.jpg")];
  bool isContains(Model mijoz) {
    if (!database.containsKey(mijoz.phonenumber)) {
      // database.addEntries([MapEntry(mijoz.raqami!, mijoz)]); bundan oson varyant bor
      database[mijoz.phonenumber!] = mijoz;

      //mapga  obyektlarni qushib beradi
      print("Car qushildi✅ ");
      return true;
    } else {
      print("bunday mashina ruyhatdan turargohda bor");
      // database.clear(); // shu joyida nega database tozalanib ketvotti?
      // tozalanishi keremas

      return false;
    }
  }

  Object login(String phone, String password) {
    /// oldin bor yoki yo'qligini tekshiramiz
    if (database.containsKey(phone)) {
      /// bor bo'lsa endi kodini tekshiramiz
      /// kodi tori bosa hammasiZor bomasa kodXato
      if (database[phone]!.password == password) {
        j=(database[phone])!;
      Username=j.name!;
        return 1;
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }
}

enum MijozStatusi {
  hammasiZor("Hammasi zo'r Homega kirdingiz"),
  royhatdanOtmagan("Siz hali ro'yhatdan o'tmagansiz"),
  kodXato("Kod xato kiritildi");

  final String message;
  const MijozStatusi(this.message);
}

class Model{
  String? name;
  String? phonenumber;
  String? password;
  String? locatcion;
  List<ModelCategory> category;
  Model({this.password,this.phonenumber,this.name,required this.category,this.locatcion});

  @override
  String toString() {
    // TODO: implement toString
    return "$name $phonenumber";
  }
}

 nimadir(Color c,String name,String price,String im){
  return Container(
    height: 50,
    width: 104,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black45),
    ),
    child:Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Image.asset(im,height: 50,width: 50,),
        ),
        Text(' $name '),
      ],
    ),


  );
}


class ModelCategory{
  String? name;
  String? price;
  String? img;
  ModelCategory(this.price,this.name,this.img);

}
class Login{
  String? phonenumber;
  String? parol;
  Login({this.phonenumber,this.parol});
@override
  String toString() {
    // TODO: implement toString
    return "$phonenumber";
  }
  bool operator ==(Object other) {
    return other is Login &&
        other.phonenumber == phonenumber &&
        other.parol == parol;
  }
}