import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ontofood/model/Reponse.dart';
import 'package:xml2json/xml2json.dart';


class ApiCall {

  static String serverUri = "http://16.16.56.82:80";//aws

  static Future<Reponse?>? AddClasse(String className) async {


    Map<String, String> headers = {
      'Content-Type': 'application/sparql-update',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/update';
    final query =
    '''
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
      PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX untitled-ontology-6: <http://www.semanticweb.org/mica/ontologies/2024/3/untitled-ontology-6#>
      
      INSERT DATA
      {
      	untitled-ontology-6:$className rdf:type owl:Class.
      };
    ''';

    final response = await http.post(Uri.parse('$endpointUrl'),headers: headers,body: query);

    if (response.statusCode == 204) {
      print(className);
      print(response.statusCode);
      print(response.body);

      Reponse areponse = Reponse("successfully added : ${response.statusCode}", response.statusCode);
      return areponse;
    } else {

      Reponse alraedyReponse = Reponse("Erreur lors de la récupération des données : ${response.statusCode}", response.statusCode);
      print("response.body");
      print(response.statusCode);
      print(response.body);
      return alraedyReponse;
    }

  }//ok
  static Future<Reponse?>? AddSubClasse(String subClassName,String superClasseName) async {


    Map<String, String> headers = {
      'Content-Type': 'application/sparql-update',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/update';
    final query =
    '''
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
      PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX untitled-ontology-6: <http://www.semanticweb.org/mica/ontologies/2024/3/untitled-ontology-6#>
      
      INSERT DATA
      {
      	untitled-ontology-6:$subClassName rdf:type owl:Class.
      	untitled-ontology-6:$subClassName rdfs:subClassOf untitled-ontology-6:$superClasseName.
      };
    ''';

    final response = await http.post(Uri.parse('$endpointUrl'),headers: headers,body: query);

    if (response.statusCode == 204) {
      print(response.statusCode);
      print(response.body);

      Reponse areponse = Reponse("successfully added : ${response.statusCode}", response.statusCode);
      return areponse;
    } else {

      Reponse alraedyReponse = Reponse("Erreur lors de la récupération des données : ${response.statusCode}", response.statusCode);
      print("response.body");
      print(response.statusCode);
      print(response.body);
      return alraedyReponse;
    }

  }//ok
  static Future<Reponse?>? AddEntity(String entityName,String className) async {


    Map<String, String> headers = {
      'Content-Type': 'application/sparql-update',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/update';
    final query =
    '''
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
      PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX untitled-ontology-6: <http://www.semanticweb.org/mica/ontologies/2024/3/untitled-ontology-6#>
      
      INSERT DATA
      {
  		untitled-ontology-6:$entityName rdf:type untitled-ontology-6:$className, owl:NamedIndividual.
      };
    ''';

    final response = await http.post(Uri.parse('$endpointUrl'),headers: headers,body: query);

    if (response.statusCode == 204) {
      print(className);
      print(response.statusCode);
      print(response.body);

      Reponse areponse = Reponse("successfully added : ${response.statusCode}", response.statusCode);
      return areponse;
    } else {

      Reponse alraedyReponse = Reponse("Erreur lors de la récupération des données : ${response.statusCode}", response.statusCode);
      print("response.body");
      print(response.statusCode);
      print(response.body);
      return alraedyReponse;
    }

  }//ok

  static Future<Reponse?>? AddEntityFood(String entityName,String imguri,List<String> ings) async {

    String listeIng = "";
    for(int i=0;i<ings.length;i++){
      listeIng=listeIng+" , untitled-ontology-6:${ings[i]}";
    }
    String lIngF = listeIng.substring(26);

    Map<String, String> headers = {
      'Content-Type': 'application/sparql-update',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/update';
    final query =
    '''
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
      PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX untitled-ontology-6: <http://www.semanticweb.org/mica/ontologies/2024/3/untitled-ontology-6#>
      
      INSERT DATA
      {
  		untitled-ontology-6:$entityName rdf:type untitled-ontology-6:Dish , untitled-ontology-6:Food , owl:NamedIndividual.
  		untitled-ontology-6:$entityName untitled-ontology-6:hasImage "$imguri".
  		untitled-ontology-6:$entityName untitled-ontology-6:hasIngredient $lIngF.
  		untitled-ontology-6:$entityName untitled-ontology-6:isFrom untitled-ontology-6:Gabon.
  		
      }
    ''';

    print(query);

    final response = await http.post(Uri.parse('$endpointUrl'),headers: headers,body: query);

    if (response.statusCode == 204) {
      print(response.statusCode);
      print(response.body);

      Reponse areponse = Reponse("successfully added : ${response.statusCode}", response.statusCode);
      return areponse;
    } else {

      Reponse alraedyReponse = Reponse("Erreur lors de la récupération des données : ${response.statusCode}", response.statusCode);
      print("response.body");
      print(response.statusCode);
      print(response.body);
      return alraedyReponse;
    }

  }
  static Future<Reponse?>? AddDP(String dpName,String domain,String range) async {


    Map<String, String> headers = {
      'Content-Type': 'application/sparql-update',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/update';
    final query =
    '''
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
      PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX untitled-ontology-6: <http://www.semanticweb.org/mica/ontologies/2024/3/untitled-ontology-6#>
      
      INSERT DATA
      {
  		untitled-ontology-6:$dpName rdf:type untitled-ontology-6:ObjectProperty.
  		untitled-ontology-6:$dpName rdfs:domain untitled-ontology-6:$domain.
  		untitled-ontology-6:$dpName rdfs:range untitled-ontology-6:$range.
  
      };
    ''';

    final response = await http.post(Uri.parse('$endpointUrl'),headers: headers,body: query);

    if (response.statusCode == 204) {
      print(response.statusCode);
      print(response.body);

      Reponse areponse = Reponse("successfully added : ${response.statusCode}", response.statusCode);
      return areponse;
    } else {

      Reponse alraedyReponse = Reponse("Erreur lors de la récupération des données : ${response.statusCode}", response.statusCode);
      print("response.body");
      print(response.statusCode);
      print(response.body);
      return alraedyReponse;
    }

  }//ok
  static Future<Reponse?>? AddOP(String opName,String domain,String range) async {


    Map<String, String> headers = {
      'Content-Type': 'application/sparql-update',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/update';
    final query =
    '''
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
      PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX untitled-ontology-6: <http://www.semanticweb.org/mica/ontologies/2024/3/untitled-ontology-6#>
      
      INSERT DATA
      {
  		untitled-ontology-6:$opName rdf:type untitled-ontology-6:ObjectProperty.
  		untitled-ontology-6:$opName rdfs:domain untitled-ontology-6:$domain.
  		untitled-ontology-6:$opName rdfs:range untitled-ontology-6:$range.
  
      };
    ''';

    final response = await http.post(Uri.parse('$endpointUrl'),headers: headers,body: query);

    if (response.statusCode == 204) {
      print(response.statusCode);
      print(response.body);

      Reponse areponse = Reponse("successfully added : ${response.statusCode}", response.statusCode);
      return areponse;
    } else {

      Reponse alraedyReponse = Reponse("Erreur lors de la récupération des données : ${response.statusCode}", response.statusCode);
      print("response.body");
      print(response.statusCode);
      print(response.body);
      return alraedyReponse;
    }

  }//ok
  static Future<Object?>? GetClasses() async {

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/query';
    final query =
    '''
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?class ?label ?description
WHERE {
  ?class a owl:Class.
}
    ''';

    final response = await http.get(Uri.parse('$endpointUrl?query=${Uri.encodeComponent(query)}'), headers: headers);

    if (response.statusCode == 200) {

      final xmlString = response.body;
      final xml2json = Xml2Json();
      xml2json.parse(xmlString);
      final jsonString = xml2json.toParker();
      final jsonObject = json.decode(jsonString);
      //print("object");
      //print(jsonObject);
      final results = jsonObject['sparql']['results']['result'];
      //print(results);
      return results;
    } else {
      print("Erreur lors de la récupération des données : ${response.statusCode}");
      return ["Erreur lors de la récupération des données : ${response.statusCode}"];
    }

  }  //ok
  static Future<List<String>?>? GetListClasses() async {

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/query';
    final query =
    '''
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?class ?label ?description
WHERE {
  ?class a owl:Class.
}
    ''';

    final response = await http.get(Uri.parse('$endpointUrl?query=${Uri.encodeComponent(query)}'), headers: headers);

    if (response.statusCode == 200) {

      final xmlString = response.body;
      final xml2json = Xml2Json();
      xml2json.parse(xmlString);
      final jsonString = xml2json.toParker();
      final jsonObject = json.decode(jsonString);
      //print("object");
      //print(jsonObject);
      final results = jsonObject['sparql']['results']['result'];
      List<String> listClass = [""];
      for(int i=0;i<results.length;i++){
        var classe = jsonObject['sparql']['results']['result'][i]['binding']['uri'];
        print( classe.toString().substring(70));
        listClass.add(classe.toString().substring(70));
      }
      print(listClass);
      return listClass;
    } else {
      print("Erreur lors de la récupération des données : ${response.statusCode}");
      return ["Erreur lors de la récupération des données : ${response.statusCode}"];
    }

  }  //ok
  static Future<List<String>?>? GetFoodIngredients(String imgurl) async {

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/query';
    final query =
    '''
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX untitled-ontology-6: <http://www.semanticweb.org/mica/ontologies/2024/3/untitled-ontology-6#>

SELECT ?ingredient ?food

WHERE {
  ?ingredient rdf:type untitled-ontology-6:FoodIngredient.
  ?food untitled-ontology-6:hasIngredient ?ingredient.
  ?food untitled-ontology-6:hasImage "$imgurl".
}
    ''';

    final response = await http.get(Uri.parse('$endpointUrl?query=${Uri.encodeComponent(query)}'), headers: headers);

    if (response.statusCode == 200) {

      final xmlString = response.body;
      final xml2json = Xml2Json();
      xml2json.parse(xmlString);
      final jsonString = xml2json.toParker();
      final jsonObject = json.decode(jsonString);
      //print("object");
      print(jsonObject);
      final results = jsonObject['sparql']['results']['result'];
      List<String> listClass = [""];
      for(int i=0;i<results.length;i++){
        var classe = jsonObject['sparql']['results']['result'][i]['binding'][0];
        print( classe.toString().substring(76,classe.toString().length-1));
        listClass.add(classe.toString().substring(76,classe.toString().length-1));
      }
      print(listClass);
      return listClass;
    } else {
      print("Erreur lors de la récupération des données : ${response.statusCode}");
      return ["Erreur lors de la récupération des données : ${response.statusCode}"];
    }

  }//ok
  static Future<List<String>?>? GetAllIngredients() async {

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/query';
    final query =
    '''
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX untitled-ontology-6: <http://www.semanticweb.org/mica/ontologies/2024/3/untitled-ontology-6#>

SELECT ?ingredient

WHERE {
  ?ingredient rdf:type untitled-ontology-6:FoodIngredient.
}
    ''';

    final response = await http.get(Uri.parse('$endpointUrl?query=${Uri.encodeComponent(query)}'), headers: headers);

    if (response.statusCode == 200) {

      final xmlString = response.body;
      final xml2json = Xml2Json();
      xml2json.parse(xmlString);
      final jsonString = xml2json.toParker();
      final jsonObject = json.decode(jsonString);
      //print("object");
      print(jsonObject);
      final results = jsonObject['sparql']['results']['result'];
      List<String> listClass = [""];
      for(int i=0;i<results.length;i++){
        var classe = jsonObject['sparql']['results']['result'][i]['binding'];
        print( classe.toString().substring(76,classe.toString().length-1));
        listClass.add(classe.toString().substring(76,classe.toString().length-1));
      }
      print(listClass);
      return listClass;
    } else {
      print("Erreur lors de la récupération des données : ${response.statusCode}");
      return ["Erreur lors de la récupération des données : ${response.statusCode}"];
    }

  }//ok
  static Future<Object?>? GetAllFood() async {

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/query';
    final query =
    '''
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX untitled-ontology-6: <http://www.semanticweb.org/mica/ontologies/2024/3/untitled-ontology-6#>

SELECT ?entity ?object

WHERE {
  ?entity rdf:type untitled-ontology-6:Dish.
  ?entity untitled-ontology-6:hasImage ?object.
}

    ''';

    final response = await http.get(Uri.parse('$endpointUrl?query=${Uri.encodeComponent(query)}'), headers: headers);

    if (response.statusCode == 200) {

      final xmlString = response.body;
      final xml2json = Xml2Json();
      xml2json.parse(xmlString);
      final jsonString = xml2json.toParker();
      final jsonObject = json.decode(jsonString);
      print("object");
      print(jsonObject);
      final results = jsonObject['sparql']['results']['result'];
      print(jsonObject['sparql']['results']['result'][1]['binding'][0]);
      print(jsonObject['sparql']['results']['result'][1]['binding'][1]);
      print(results);
      return results;
    } else {
      print("Erreur lors de la récupération des données : ${response.statusCode}");
      return ["Erreur lors de la récupération des données : ${response.statusCode}"];
    }

  }    //ok
  static Future<Object?>? GetEntity(String classe) async {

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/query';
    final query =
    '''
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX untitled-ontology-6: <http://www.semanticweb.org/mica/ontologies/2024/3/untitled-ontology-6#>

SELECT ?entity
WHERE {
  ?entity rdf:type ?type.
  ?type rdfs:subClassOf* untitled-ontology-6:$classe.
}
    ''';

    final response = await http.get(Uri.parse('$endpointUrl?query=${Uri.encodeComponent(query)}'), headers: headers);

    if (response.statusCode == 200) {

      final xmlString = response.body;
      final xml2json = Xml2Json();
      xml2json.parse(xmlString);
      final jsonString = xml2json.toParker();
      final jsonObject = json.decode(jsonString);
      print("object");
      print(jsonObject);
      print(jsonObject['sparql']['results']);
      if(jsonObject['sparql']['results']==null){
        print("object1");
        return[];
      }else{
        final results = jsonObject['sparql']['results']['result'];
        print(results);
        return results;
      }

    } else {
      print("Erreur lors de la récupération des données : ${response.statusCode}");
      return ["Erreur lors de la récupération des données : ${response.statusCode}"];
    }

  }  //ok
  static Future<Object?>? query(String query) async {

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
    };

    String queryResult = '';

    final endpointUrl = '$serverUri/gabon/query';


    final response = await http.get(Uri.parse('$endpointUrl?query=${Uri.encodeComponent(query)}'), headers: headers);

    if (response.statusCode == 200) {

      final xmlString = response.body;
      final xml2json = Xml2Json();
      xml2json.parse(xmlString);
      final jsonString = xml2json.toParker();
      final jsonObject = json.decode(jsonString);
      print("object");
      print(jsonObject);

      if(jsonObject['sparql']==null){
        print("object1");
        return[];
      }else if(jsonObject['sparql']['results']==null){
        print("object2");
        return[];
      }else{
        final results = jsonObject['sparql']['results']['result'];
        print(results);
        return results;
      }

    } else {
      print(response.body);
      print("Erreur lors de la récupération des données : ${response.statusCode}");
      return ["Erreur lors de l'execution de la requette error code : ${response.statusCode}\n ${response.body}"];
    }

  }       //ok


}
