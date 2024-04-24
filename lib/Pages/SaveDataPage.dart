import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ontofood/Services/ApiCall.dart';


class SaveDataPage extends StatefulWidget {
  const SaveDataPage({super.key, required this.title});

  final String title;

  @override
  State<SaveDataPage> createState() => _SaveDataPageState();
}

class _SaveDataPageState extends State<SaveDataPage> {

  var jsonObject = json.decode("[]");

  String defaultValue = "Classe";
  String defaultValue1 = "";
  String defaultValue2 = "";
  String defaultValue3 = "";
  String defaultValue4 = "";
  String defaultValue5 = "";
  String defaultValue6 = "";
  String defaultValue210 = "";

  var allType = ["Classe","SubClasse","Entity","DataProperty","ObjectProperty"];
  var allClasses =[""];
  var alling=[""];

  final TextEditingController nameControllerClass = TextEditingController();
  final TextEditingController nameControllerSubClass = TextEditingController();
  final TextEditingController nameControllerEntity = TextEditingController();
  final TextEditingController nameControllerDP = TextEditingController();
  final TextEditingController nameControllerOP = TextEditingController();
  final TextEditingController uriController = TextEditingController();
  //final TextEditingController ingController = TextEditingController();

  //Food newFood = Food.empty();

  //List<String> listClass = [""];

  @override
  void initState() {
getClasse();
geting();
    //allClasses = ApiCall.GetListClasses();
    //jsonObject = getClasse();
    super.initState();
  }

  void getClasse() {

    var keyConnect = ApiCall.GetListClasses();

    keyConnect?.then((value) => setState(() {
      print(value);
      allClasses = value!;

    }));
  }

  void geting() {

    var keyConnect = ApiCall.GetAllIngredients();

    keyConnect?.then((value) => setState(() {
      print(value);
      alling = value!;

    }));
  }

  void addClasse() {

    var keyConnect = ApiCall.AddClasse(nameControllerClass.text);

    keyConnect?.then((value) => setState(() {

      if(value?.statusCode == 204){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text("Successfully add",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text("Donvxnées invalident",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }

    }));
  }

  void addSubClasse() {

    var keyConnect = ApiCall.AddSubClasse(nameControllerSubClass.text, defaultValue1);

    keyConnect?.then((value) => setState(() {

      if(value?.statusCode == 204){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text("Successfully add",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text("Donvxnées invalident",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }

    }));
  }


  void addEntity() {

    var keyConnect = ApiCall.AddEntity(nameControllerEntity.text, defaultValue2);

    keyConnect?.then((value) => setState(() {

      if(value?.statusCode == 204){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text("Successfully add",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text("Donvxnées invalident",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }

    }));
  }
  void addEntityFood() {

    var keyConnect = ApiCall.AddEntityFood(nameControllerEntity.text, uriController.text,foodIng);

    keyConnect?.then((value) => setState(() {

      if(value?.statusCode == 204){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text("Successfully add",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text("Donvxnées invalident",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }

    }));
  }

  void addObjectProperty() {

    var keyConnect = ApiCall.AddOP(nameControllerOP.text, defaultValue3, defaultValue4);

    keyConnect?.then((value) => setState(() {

      if(value?.statusCode == 204){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text("Successfully add",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text("Donvxnées invalident",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }

    }));
  }

  void addDataProperty() {

    var keyConnect = ApiCall.AddDP(nameControllerDP.text, defaultValue5, defaultValue6);

    keyConnect?.then((value) => setState(() {

      if(value?.statusCode == 204){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text("Successfully add",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text("Donvxnées invalident",textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));
      }

    }));
  }


  List<String> foodIng = [""];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("FoodOnto"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child:Ink.image(
                  image: AssetImage("images/AddDataBG.jpg"),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Container(
                          height: MediaQuery.of(context).size.height/6,
                          width: MediaQuery.of(context).size.width/2,
                          color: Colors.transparent,
                          child:
                          Text("Add Data",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                            textAlign: TextAlign.center,)
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Type : ",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                            textAlign: TextAlign.center,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            height: 30,
                            width: MediaQuery.of(context).size.width/1.4,
                            child: DropdownButton(
                                padding: EdgeInsets.only(left: 80, right: 20),
                                value: defaultValue,
                                items: allType.map((String type) {
                                  return DropdownMenuItem(
                                      value: type,
                                      child: Text(type));
                                }).toList(),
                                onChanged: (String? newType){
                                  setState(() {
                                    defaultValue = newType!;
                                  });
                                }),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),

                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          if(defaultValue=="Classe") ... [
                            Container(
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Name : ",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,),
                                      Container(
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(25))
                                          ),
                                          height: 30,
                                          width: MediaQuery.of(context).size.width/1.4,
                                          child: TextField(
                                            controller: nameControllerClass,

                                            decoration: InputDecoration.collapsed(
                                              hintText: "Entrez le nom de votre classe",
                                              hintStyle: TextStyle(color: Colors.black26),
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ],),
                            ),
                          ]else if(defaultValue=="SubClasse") ... [
                            Container(
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("super class : ",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,),

                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        height: 30,
                                        width: MediaQuery.of(context).size.width/1.8,
                                        child: DropdownButton(
                                            padding: EdgeInsets.only(left: 20, right: 20),
                                            value: defaultValue1,
                                            items: allClasses.map((String type) {
                                              return DropdownMenuItem(
                                                  value: type,
                                                  child: Text(type));
                                            }).toList(),
                                            onChanged: (String? newType){
                                              setState(() {
                                                defaultValue1 = newType!;
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Name : ",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,),
                                      Container(
                                        padding: EdgeInsets.only(left: 10,right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        height: 30,
                                        width: MediaQuery.of(context).size.width/1.5,
                                        child: TextField(
                                          controller: nameControllerSubClass,

                                          decoration: InputDecoration.collapsed(
                                            hintText: "Entrez le nom de votre sous classe",
                                            hintStyle: TextStyle(color: Colors.black26),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                ],),
                            ),
                          ]else if(defaultValue=="Entity") ... [
                            Container(
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Class type : ",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        height: 30,
                                        width: MediaQuery.of(context).size.width/1.7,
                                        child: DropdownButton(
                                            padding: EdgeInsets.only(left: 20, right: 20),
                                            value: defaultValue2,
                                            items: allClasses.map((String type) {
                                              return DropdownMenuItem(
                                                  value: type,
                                                  child: Text(type));
                                            }).toList(),
                                            onChanged: (String? newType){
                                              setState(() {
                                                defaultValue2 = newType!;
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      if(defaultValue2=="Food"||defaultValue2=="Dish") ... [
                                        Container(
                                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text("Name : ",
                                                    style: TextStyle(fontWeight: FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,),
                                                  Container(
                                                      padding: EdgeInsets.only(left: 10,right: 10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.all(Radius.circular(25))
                                                      ),
                                                      height: 30,
                                                      width: MediaQuery.of(context).size.width/1.4,
                                                      child: TextField(
                                                        controller: nameControllerEntity,

                                                        decoration: InputDecoration.collapsed(
                                                          hintText: "Entrez le nom de votre repas",
                                                          hintStyle: TextStyle(color: Colors.black26),
                                                        ),
                                                      )
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 20,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text("ImageURI : ",
                                                    style: TextStyle(fontWeight: FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,),
                                                  Container(
                                                    padding: EdgeInsets.only(left: 10,right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.all(Radius.circular(25))
                                                    ),
                                                    height: 30,
                                                    width: MediaQuery.of(context).size.width/1.7,
                                                    child: TextField(
                                                      controller: uriController,

                                                      decoration: InputDecoration.collapsed(
                                                        hintText: "Entrez l'URI de l'image",
                                                        hintStyle: TextStyle(color: Colors.black26),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 20,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Column(children: [

                                                    Text("FoodIngredient : ",
                                                      style: TextStyle(fontWeight: FontWeight.bold,
                                                          fontSize: 20,
                                                          color: Colors.white),
                                                      textAlign: TextAlign.center,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.all(Radius.circular(25))
                                                          ),
                                                          height: 30,
                                                          width: MediaQuery.of(context).size.width/3.7,
                                                          child: DropdownButton(
                                                            isExpanded:true,
                                                              padding: EdgeInsets.only(left: 3, right: 3),
                                                              value: defaultValue210,
                                                              items: alling.map((String type) {
                                                                return DropdownMenuItem(
                                                                    value: type,
                                                                    child: Text(type));
                                                              }).toList(),
                                                              onChanged: (String? newType){
                                                                setState(() {
                                                                  defaultValue210 = newType!;
                                                                });
                                                              }),
                                                        ),
                                                        IconButton(onPressed: (){
                                                          setState(() {
                                                            foodIng.add(defaultValue210);
                                                          });
                                                        }, icon: Icon(Icons.add_circle,color: Colors.green,size: 35,))
                                                      ],
                                                    ),
                                                  ],),
                                                  Container(
                                                      padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.all(Radius.circular(15))
                                                      ),
                                                      height: 120,
                                                      width: MediaQuery.of(context).size.width/2.1,
                                                      child: ListView(
                                                        children: List.generate(foodIng.length, (index) {
                                                          return InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                print(foodIng[index]);
                                                                foodIng.remove(foodIng[index]);
                                                              });
                                                            },
                                                            onLongPress: (){
                                                              //selection
                                                            },
                                                            child:  Text(foodIng[index],
                                                              style: TextStyle(fontWeight: FontWeight.bold,
                                                                  fontSize: 14,
                                                                  color: Colors.black),
                                                              textAlign: TextAlign.center,),

                                                          );
                                                        }),
                                                      ),
                                                  )
                                                ],
                                              ),
                                            ],),
                                        ),
                                      ]else ... [
                                        Container(
                                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text("Name : ",
                                                    style: TextStyle(fontWeight: FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,),
                                                  Container(
                                                    padding: EdgeInsets.only(left: 10,right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.all(Radius.circular(25))
                                                    ),
                                                    height: 30,
                                                    width: MediaQuery.of(context).size.width/1.5,
                                                    child: TextField(
                                                      controller: nameControllerEntity,

                                                      decoration: InputDecoration.collapsed(
                                                        hintText: "Entrez le nom de votre sous classe",
                                                        hintStyle: TextStyle(color: Colors.black26),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 20,),
                                            ],),
                                        ),
                                      ]
                                    ],
                                  ),
                                ],),
                            ),
                          ]else if(defaultValue=="ObjectProperty") ... [
                            Container(
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Domain : ",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        height: 30,
                                        width: MediaQuery.of(context).size.width/1.6,
                                        child: DropdownButton(
                                            padding: EdgeInsets.only(left: 80, right: 20),
                                            value: defaultValue3,
                                            items: allClasses.map((String type) {
                                              return DropdownMenuItem(
                                                  value: type,
                                                  child: Text(type));
                                            }).toList(),
                                            onChanged: (String? newType){
                                              setState(() {
                                                defaultValue3 = newType!;
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Range : ",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        height: 30,
                                        width: MediaQuery.of(context).size.width/1.6,
                                        child: DropdownButton(
                                            padding: EdgeInsets.only(left: 80, right: 20),
                                            value: defaultValue4,
                                            items: allClasses.map((String type) {
                                              return DropdownMenuItem(
                                                  value: type,
                                                  child: Text(type));
                                            }).toList(),
                                            onChanged: (String? newType){
                                              setState(() {
                                                defaultValue4 = newType!;
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Name : ",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,),
                                      Container(
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(25))
                                          ),
                                          height: 30,
                                          width: MediaQuery.of(context).size.width/1.6,
                                          child: TextField(
                                            controller: nameControllerOP,

                                            decoration: InputDecoration.collapsed(
                                              hintText: "Entrez le nom de votre propriété",
                                              hintStyle: TextStyle(color: Colors.black26),
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ],),
                            ),
                          ]else if(defaultValue=="DataProperty") ... [
                            Container(
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Domain : ",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        height: 30,
                                        width: MediaQuery.of(context).size.width/1.6,
                                        child: DropdownButton(
                                            padding: EdgeInsets.only(left: 80, right: 20),
                                            value: defaultValue5,
                                            items: allClasses.map((String type) {
                                              return DropdownMenuItem(
                                                  value: type,
                                                  child: Text(type));
                                            }).toList(),
                                            onChanged: (String? newType){
                                              setState(() {
                                                defaultValue5 = newType!;
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Range : ",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        height: 30,
                                        width: MediaQuery.of(context).size.width/1.6,
                                        child: DropdownButton(
                                            padding: EdgeInsets.only(left: 80, right: 20),
                                            value: defaultValue6,
                                            items: allClasses.map((String type) {
                                              return DropdownMenuItem(
                                                  value: type,
                                                  child: Text(type));
                                            }).toList(),
                                            onChanged: (String? newType){
                                              setState(() {
                                                defaultValue6 = newType!;
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Name : ",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,),
                                      Container(
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(25))
                                          ),
                                          height: 30,
                                          width: MediaQuery.of(context).size.width/1.6,
                                          child: TextField(
                                            controller: nameControllerDP,

                                            decoration: InputDecoration.collapsed(
                                              hintText: "Entrez le nom de votre propriété",
                                              hintStyle: TextStyle(color: Colors.black26),
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ],),
                            ),
                          ],
                        ],),
                      SizedBox(height: 90,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                          onPressed: (){
                            if(defaultValue=="Classe") {
                              addClasse();
                            }else if(defaultValue=="SubClasse"){
                              addSubClasse();
                            }else if(defaultValue=="Entity"){
                              if(defaultValue2=="Food"||defaultValue2=="Dish"){
                                addEntityFood();
                              }else{
                                addEntity();
                              }
                            }else if(defaultValue=="ObjectProperty") {
                              addObjectProperty();
                            }else if(defaultValue=="DataProperty") {
                              addDataProperty();
                            }

                          },
                          child: Text("Submit",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black54),
                            textAlign: TextAlign.center,))
                        ],)
                    ],
                  )
              ),

            ],
          )
      ),
    );
  }


}
