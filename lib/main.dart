import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  AnimationController animationController;
  int dur=5;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: new Duration(seconds: dur),);
    animationController.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie Animation"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset("assets/lottie/lottie-man-working-in-the-office.json",
                // repeat: true,
                controller: animationController,
                animate: true,
                  reverse: true,
                onLoaded: (value){
                }
              ),
              SizedBox(
                height: 10,
              ),
              // Lottie.network("https://assets8.lottiefiles.com/datafiles/cr8NYdAEA9Dbv3h/data.json",
              // reverse: true,
              //   repeat: true,
              //   animate: true,
              // ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: (){
                          setState(() {
                            //used to start the animation
                            animationController.forward();
                          });
                        },
                        child: Text("Start"),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.green)
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: (){
                          //used to pause the animation in specified duration
                          animationController.stop();
                        },
                        child: Text("Pause"),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.red)
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: (){
                          //used to loop the animation
                          animationController.repeat(reverse: true);
                        },
                        child: Text("Repeat"),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.blueAccent)
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: (){
                          //used to skip the a duration
                          animationController.forward(from: 0.2);
                        },
                        child: Text("Forward"),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.yellowAccent)
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: (){
                          //used to reverse the animation from specified duration
                          animationController.reverse();
                        },
                        child: Text("Reverse"),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.orangeAccent)
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: (){
                          //used to stop and start from intial stage
                         animationController.reset();
                        },
                        child: Text("Reset"),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.pinkAccent)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
