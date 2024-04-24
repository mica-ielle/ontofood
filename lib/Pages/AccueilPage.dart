import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ontofood/Pages/QueryPage.dart';
import 'package:ontofood/Pages/SaveDataPage.dart';


class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key, required this.title});

  final String title;

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {


  String defaultValue = "Classe";
  var allType = ["Classe","SubClasse","Entity"];

  final TextEditingController nameController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("FoodOnto"),
        centerTitle: true,
      ),
      body: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child:Ink.image(
                  image: AssetImage("images/AccueilBG.jpg"),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:150),
                  Container(
                      margin: EdgeInsets.all(15),
                      height: 40,
                      width: MediaQuery.of(context).size.width/1.04,
                      color: Colors.transparent,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return SaveDataPage(title: '',);
                            }));
                      }, child: Text("Add Data",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                        textAlign: TextAlign.center,),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(15),
                      height: 40,
                      width: MediaQuery.of(context).size.width/1.04,
                      color: Colors.transparent,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return QueryPage(title: '',);
                            }));
                      }, child: Text("Queries",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                        textAlign: TextAlign.center,),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                      )
                  ),
                  SizedBox(height: 400),
                  Text("Powered By NTMG",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white24),
                    textAlign: TextAlign.center,)
                ],
              )
            ],
          )),
    );
  }


}
