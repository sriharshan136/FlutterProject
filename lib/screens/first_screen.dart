import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/global/global.dart' as globalData;

class FirstScreen extends StatefulWidget {
  const FirstScreen({ Key? key }) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        actions: [
          InkWell(child: Icon(Icons.close,size: 40,color: Colors.red,),
          onTap: (){
            SystemNavigator.pop();
          },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ${globalData.name} to First screen"),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/secondScreen');
              },
              child: Text("Click here for Second screen")
            )
          ],
        ),
      ),
    );
  }
}