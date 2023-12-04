import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:online_shop/common/database.dart';
import 'package:http/http.dart'as http;
import '../../common/model/model.dart';

class Asosiy extends StatefulWidget {
  const Asosiy({super.key});

  @override
  State<Asosiy> createState() => _AsosiyState();
}

class _AsosiyState extends State<Asosiy> {

  @override
  Widget build(BuildContext context) {
final search=TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body:SingleChildScrollView(
          child:  Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.menu,size: 30,color: Colors.white,)),
                  ),
                  SizedBox(width: 264,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.shop_two_sharp,size: 30,color: Colors.white,)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Welcome\n $Username',style: TextStyle(fontSize: 30,color: Colors.white),),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.white,
                  controller: search,

                  decoration: InputDecoration(

                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",

                    suffixIcon: Icon(Icons.brush_sharp),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                height: 523,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Category',style: TextStyle(fontSize: 20,color: Colors.green),),
                          ),
                        ),
                        SizedBox(width: 200,),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('See All',style: TextStyle(fontSize: 14,color: Colors.black38),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 320,
                          child:  ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                                Padding(padding: EdgeInsets.only(left: 10),
                                child: nimadir(Colors.black38, "Bugati", "221", "img/images.jpg"),
                              ),  Padding(padding: EdgeInsets.only(left: 10),
                                child: nimadir(Colors.black38, "Bugati", "221", "img/images.jpg"),
                              ),  Padding(padding: EdgeInsets.only(left: 10),
                                child: nimadir(Colors.black38, "Bugati", "221", "img/images.jpg"),
                              ),  Padding(padding: EdgeInsets.only(left: 10),
                                child: nimadir(Colors.black38, "Bugati", "221", "img/images.jpg"),
                              ),  Padding(padding: EdgeInsets.only(left: 10),
                                child: nimadir(Colors.black38, "Bugati", "221", "img/images.jpg"),
                              ),
                            ],
                          ),
                        ),




                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Popular',style: TextStyle(fontSize: 20,color: Colors.green),),
                          ),
                        ),
                        SizedBox(width: 210,),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('See All',style: TextStyle(fontSize: 14,color: Colors.black38),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 80,
                          width: 300,

                          child:  StreamBuilder<List<MyModel> >(
                              stream: getApi().asStream(),
                              builder: (context, AsyncSnapshot<List<MyModel> > snapshot) {
                                if(snapshot.hasData) {
                                  return ListView.builder(

                                      itemCount: snapshot.requireData.length,
                                      itemBuilder: (context, index) {


                                        return ListTile(


                                          leading: Image.network(snapshot.data?[index].image ?? ""),
                                        );
                                      });
                                }
                                else {
                                  return Center(child: CircularProgressIndicator(),);
                                }
                              }
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Top',style: TextStyle(fontSize: 20,color: Colors.green),),
                          ),
                        ),
                        SizedBox(width: 246,),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('See All',style: TextStyle(fontSize: 14,color: Colors.black38),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height:254,
                          width: 300,

                          child:  StreamBuilder<List<MyModel> >(
                              stream: getApi().asStream(),
                              builder: (context, AsyncSnapshot<List<MyModel> > snapshot) {
                                if(snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount: snapshot.requireData.length,
                                      itemBuilder: (context, index) {


                                        return ListTile(

                                          title: Text(snapshot.data?[index].title ??""),

                                          trailing: Icon(Icons.account_balance),
                                          leading: Image.network(snapshot.data?[index].image ?? ""),
                                        );
                                      });
                                }
                                else {
                                  return Center(child: CircularProgressIndicator(),);
                                }
                              }
                          ),
                        ),




                      ],
                    ),

                  ],
                ),
              ),



Container(height: 100,width: 100,color: Colors.green,),
Container(height: 100,width: 100,color: Colors.green,),
Container(height: 100,width: 100,color: Colors.green,),
Container(height: 100,width: 100,color: Colors.green,),
            ],
          ),
        ),

      ),
    );
  }
  Future<List<MyModel> > getApi() async {
    final uri = Uri.parse("https://fakestoreapi.com/products");

    final request = await http.get(uri).then((value) {
      try {

        if (value.statusCode == 200) {
          var data = jsonDecode(value.body);
          data.forEach((element) {
            malumotlar.currencyList.add(MyModel.fromJson(element));
          });
          return malumotlar.currencyList;
        } else {

          throw(Exception());
        }


      } catch (e) {
        rethrow;
      }
    });

    return malumotlar.currencyList;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }
}
