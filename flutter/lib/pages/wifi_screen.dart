import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:j_2_9/helpers/firebase.dart';



class WiFiScreen extends StatelessWidget {

  void getData() async {
    String username = 'anykey';
  String password = '539531f59449847a21d2014840efa655-us4';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);
  Response response = await get('https://us4.api.mailchimp.com/3.0/lists',
  headers: <String, String>{'authorization': basicAuth}
  );
  if (response.statusCode == 200) {
    String data = response.body;
    print(data);
  } else {
    print(response.statusCode);
  }
}
  @override
Widget build(BuildContext context) {
  return new SingleChildScrollView(
    child:
   new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
  padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
  child:
          new Text(
          "Enter your email address below to recieve the details to our free high speed WiFi and exclusive offers.",
            style: new TextStyle(fontSize:20.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins")
          )),
Padding(
  padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
  child:
          new TextFormField(
             validator: (value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  },
            decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'your@email.com',
  ),
            style: new TextStyle(fontSize:16.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w500,           
            fontFamily: "Poppins")
          )),
         
             new RaisedButton(key:null, onPressed:buttonPressed,
            color: Color.fromRGBO(205, 23, 25, 1),
            shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
            child:
              new Text(
              "SUBMIT EMAIL",
                style: new TextStyle(fontSize:18.0,
                letterSpacing: 1,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w800,
                fontFamily: "Poppins")
              )
            ),
            Padding(
  padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
  child:
          new Text(
          "By submitting your email details above you agree to our terms of privacy.",
            style: new TextStyle(fontSize:15.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins")
          )),
        ]
      ),
);
      
}void buttonPressed(){
        getData();
}



}

