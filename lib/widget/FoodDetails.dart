
import 'package:flutter/material.dart';


Future<dynamic> showFood(BuildContext context,String imgURL,String foodName,List<dynamic> ingList){
  late var variable = ingList;

  return showDialog(context: context,
      //barrierDismissible: false,
      builder: (BuildContext context){
        return new SimpleDialog(
          contentPadding: EdgeInsets.all(10.0),
          children: [
            new Text(foodName,textAlign: TextAlign.center),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Container(
        color:Colors.redAccent,
        height: MediaQuery.of(context).size.height/4,
        width:120,
                  child: Image.network(imgURL,fit: BoxFit.fill,),
        ),Column(
                  children: [
                    Text("INGREDIENTS"),
                    Container(
                      //color:Colors.redAccent,
                      height: MediaQuery.of(context).size.height/4,
                      width:140,
                      child: ListView(
                        children: List.generate(variable.length, (index) {
                          final classe = variable[index];
                          var valeur = classe.toString();
                          return InkWell(
                            onTap: (){
                            },
                            onLongPress: (){
                              //selection
                            },
                            child:  Text("$valeur",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                              textAlign: TextAlign.center,),

                          );
                        }),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
          ],
        );
      });
}
