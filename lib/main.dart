
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/screens/first_screen.dart';
import 'package:flutter_application_2/screens/second_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_2/global/global.dart' as globalData;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        primarySwatch: Colors.cyan,
      ),
      initialRoute: "/homeScreen",
      routes: {
        "/homeScreen":(context) => MyHomePage(title: '',),
        "/firstScreen":(context) => FirstScreen(),
        "/secondScreen":(context) => SecondScreen()
      },
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String globleText = "Alerts";
  final _fkey = GlobalKey<FormState>();


  String titleText = "Home Screen";
  launchUrl(String url){
    launch(url);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset : false,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Container(
              height: 200.0,
              color: Colors.lightGreenAccent,
            ),),
            ListTile(
              leading: Icon(Icons.login),
              title: Text("Log in"),
              onTap: (){
                setState(() {
                  globleText = "Logged In";
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
              onTap: (){
                setState(() {
                  globleText = "Logged Out";
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text("Updates"),
              onTap: (){
                setState(() {
                  globleText = "No Updates Available";
                });
                Fluttertoast.showToast(
                  msg: "No updates",
                  backgroundColor: Colors.purpleAccent
                );
              },
              onLongPress: (){
                setState(() {
                  globleText = "Long press feature is not Available";
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              onTap: (){
                String urlString = "https://www.google.com/";
                launchUrl(urlString);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text(
          titleText,
          style: TextStyle(color: Colors.red),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          InkWell(child: Icon(Icons.login,size: 40,color: Colors.black),
          onTap: (){
            setState(() {
              titleText = "Signing in";
            });
          },
          ),
          InkWell(child: Icon(Icons.close,size: 40,color: Colors.red,),
          onTap: (){
            SystemNavigator.pop();
          },
          )
        ],
      ),
      
      body: Column(
        children: [
          SizedBox(
            height : 572.0,
            child: 
              ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                padding: EdgeInsets.all(10.0),
                children: <Widget>[  
                  Container(
                    child: Image.asset('assets/images/Frameworks.png'),
                  ), 
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Form(
                      key: _fkey,
                      child: TextFormField(
                        validator: (value){
                          if(value == null|| value.isEmpty){
                            return "please fill";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'User name',
                          labelText: 'Enter your name',
                          border: OutlineInputBorder()
                        ),
                        onChanged: (value){
                          setState(() {
                            globalData.name = value;
                          });
                          
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      onPressed: (){
                        if(_fkey.currentState!.validate()){
                          Fluttertoast.showToast(msg: "Its good to proceed",backgroundColor: Colors.purpleAccent);
                          Navigator.pushNamed(context, '/firstScreen');
                        }
                      },
                      child: Text("Submit")
                    ),
                  ),
                  SizedBox(
                    height: 10.0
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return FirstScreen();
                        }));
                      },
                      child: Text("Click here for 1st Screen"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.orange),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SecondScreen();
                        }));
                      },
                      child: Text("Click here for 2nd Screen"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.orange),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        globleText,
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Image.network('https://blog.codemagic.io/uploads/covers/codemagic-blog-header-3.png')
                  
                ],
              ),
          ),
          Container(
            color: Colors.greenAccent,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home,size: 40.0,),
                Icon(Icons.store,size: 40.0,),
                Icon(Icons.notifications,size: 40.0,),
                Icon(Icons.system_update,size: 40.0,),
                Icon(Icons.verified_user,size: 40.0,),
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}

