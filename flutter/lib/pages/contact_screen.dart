import 'package:flutter/material.dart';
import 'package:j_2_9/helpers/firebase.dart';


class ContactScreen extends StatelessWidget {

  @override
  
Widget build(BuildContext context) {
  return 
  new SingleChildScrollView(
    child:
   new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
  padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
  child:
          new Text(
          "Special Offers",
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize:30.0,
            color: Color.fromRGBO(205, 23, 25, 1),
            fontWeight: FontWeight.w700,
            fontFamily: "Poppins")
          )),       
          Padding( padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child:   ListTile(
              title: Image.asset("assets/special1.jpg"),
            ),
              ),
                            new Divider(height: 5.0,color: Colors.grey,),
                             Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child:   ListTile(
              title: Image.asset("assets/special1.jpg"),
            ),
            ),
                            new Divider(height: 5.0,color: Colors.grey,),
                                      Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child:   ListTile(
              title: Image.asset("assets/special1.jpg"),
            ),
              ),
                            new Divider(height: 5.0,color: Colors.grey,),
                             Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child:   ListTile(
              title: Image.asset("assets/special1.jpg"),
            ),
            ),
        ]
      ),
);
      
}
}

