import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ontofood/Services/ApiCall.dart';
import 'package:ontofood/widget/FoodDetails.dart';


class QueryPage extends StatefulWidget {
  const QueryPage({super.key, required this.title});

  final String title;

  @override
  State<QueryPage> createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {


  final jsonObject = json.decode("[]");

  late var variable = jsonObject;
  late var variableEntity = variable;
  late var variableFood = variable;
  late var variableQuery = variable;
  var variableList =[];


  String defaultValue = "Classe";
  bool containFood = false;
  //var allType = ["Classe","SubClasse","Entity","Foods"];
  var allType = ["Classe","Foods"];

  final TextEditingController queryController = TextEditingController();
  bool textChecked = true;

 // List<Object> listClasse = [];


  void getIng(String s,String ss) {
    print("emmmmmmmmmmmmmmmmmmmeeee");
    print(s);
    print("emmmmmmmmmmmmmmmmmmmeeee");

    var keyConnect = ApiCall.GetFoodIngredients( s);

    keyConnect?.then((value) => setState(() {
      print("hhhhh");
      print(value);
      variableList = value!;


      showFood(context,s+"?raw=true",ss,variableList);
    }));
  }


  void getClasse() {

    var keyConnect = ApiCall.GetClasses();

    keyConnect?.then((value) => setState(() {
      print(value);
      variable = value!;

    }));
  }
  void getAllFoods() {

    var keyConnect = ApiCall.GetAllFood();


    keyConnect?.then((value) => setState(() {
      print(value);
      variableFood = value!;

    }));
  }
  void getEntity(String classe) {

    var keyConnect = ApiCall.GetEntity(classe);

    keyConnect?.then((value) => setState(() {
      print(value);
      variableEntity = value!;

    }));

  }
  void myQuery() {

    var keyConnect = ApiCall.query(queryController.text) ;

    keyConnect?.then((value) => setState(() {
      print(value);
      variableQuery = value!;

    }));
  }



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
                  image: AssetImage("images/QueryBG.jpg"),
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
                    color: Colors.black38,
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Text Query",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Switch(value: textChecked, onChanged: (bool checked){
                          setState(() {
                            textChecked = checked;
                          });
                        }),
                        Text("Select Query",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                          textAlign: TextAlign.center,),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        if(textChecked) ... [Row(                                                              //select
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 5,height: 120,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              height: 40,
                              width: MediaQuery.of(context).size.width/1.4,
                              child: DropdownButton(
                                  icon: Icon(Icons.list,size: 35,),
                                  padding: EdgeInsets.only(left: 90, right: 70),
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
                            ),
                            IconButton(onPressed: (){
                              if(defaultValue=="Classe"){
                                containFood=false;
                                getClasse();
                              }else if(defaultValue=="Foods"){
                                containFood=true;
                                getAllFoods();
                              }
                            }, icon: Icon(Icons.search,color: Colors.greenAccent,size: 50,))
                          ],
                        ) ]else ... [Row(                                                                                 //text
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 5,),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              height: 120,
                              width: MediaQuery.of(context).size.width/1.4,
                              child: TextField(
                                controller: queryController,

                                decoration: InputDecoration.collapsed(
                                  hintText: "Write your query",
                                  hintStyle: TextStyle(color: Colors.black26),
                                ),
                                maxLines: 5,
                                minLines: 3,
                              ),
                            ),
                            IconButton(onPressed: (){
                              myQuery();
                            }, icon: Icon(Icons.search,color: Colors.greenAccent,size: 50,))
                          ],
                        ) ],
                      ],),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Results",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                          textAlign: TextAlign.center,),

                      ],
                    ),
                    SizedBox(height: 20,),
                    if(textChecked) ... [
                      containFood?Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 1),
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        height: MediaQuery.of(context).size.height/1.85,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.count(
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          crossAxisCount: 2,
                          children: List.generate(variableFood.length, (index) {
                            final classe = variableFood[index]['binding'][1];
                            final classee = variableFood[index]['binding'][0];
                            var valeur = classe.toString().substring(10,classe.toString().length-1);
                            var valeure = classee.toString().substring(76,classee.toString().length-1);
                            // final varr = int.parse(classe[index]['price'].toString());
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  getIng(valeur,valeure);
                                });


                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text(valeure,textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)));

                                print(valeur);
                                getEntity(valeur);
                              },
                              onLongPress: (){
                                //selection
                              },
                              child: Image.network("$valeur?raw=true",fit: BoxFit.cover,),

                            );
                          }),
                        ),
                      ):Container(
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          height: MediaQuery.of(context).size.height/1.85,
                          width: MediaQuery.of(context).size.width,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Classes",
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.blueGrey),
                                    textAlign: TextAlign.center,),
                                  Text("Entities",
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.blueGrey),
                                    textAlign: TextAlign.center,),
                                ],
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(right: 1),
                                    decoration: BoxDecoration(
                                        color: Colors.white60,
                                        borderRadius: BorderRadius.all(Radius.circular(25))
                                    ),
                                    height: MediaQuery.of(context).size.height/1.99,
                                    width: MediaQuery.of(context).size.width/2-1,
                                    child: ListView(
                                      children: List.generate(variable.length, (index) {
                                        final classe = variable[index];
                                        var valeur = classe.toString().substring(86,classe.toString().length-2);
                                        return InkWell(
                                          onTap: (){
                                            print(valeur);
                                            getEntity(valeur);
                                          },
                                          onLongPress: (){
                                            //selection
                                          },
                                          child:  Text("$valeur",
                                            style: TextStyle(fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,),

                                        );
                                      }),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(right: 1),
                                    decoration: BoxDecoration(
                                        color: Colors.white60,
                                        borderRadius: BorderRadius.all(Radius.circular(25))
                                    ),
                                    height: MediaQuery.of(context).size.height/1.99,
                                    width: MediaQuery.of(context).size.width/2-1,
                                    child: ListView(
                                      children: List.generate(variableEntity.length, (index) {
                                        final classe = variableEntity[index];
                                        var valeur = variableEntity.length==1?variableEntity.toString().substring(86,variableEntity.toString().length-2):classe.toString().substring(86,classe.toString().length-2);
                                        return InkWell(
                                          onTap: (){
                                            print(valeur);
                                          },
                                          onLongPress: (){
                                            //selection
                                          },
                                          child:  Text("$valeur",
                                            style: TextStyle(fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,),

                                        );
                                      }),
                                    ),
                                  ),],
                              ),
                            ],
                          )
                      ),
                    ]else ... [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 1),
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        height: MediaQuery.of(context).size.height/1.99,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          children: List.generate(variableQuery.length, (index) {
                            final classe = variableQuery[index];
                            var valeur = classe.toString();
                            return InkWell(
                              onTap: (){
                                print(valeur);
                                getEntity(valeur);
                              },
                              onLongPress: (){
//selection
                              },
                              child:  Text("$valeur",
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                                textAlign: TextAlign.center,),

                            );
                          }),
                        ),
                      ),
                    ],


                    SizedBox(height: 20,),

                  ],
                )
              ),

            ],
          )
      ),
    );
  }


}
