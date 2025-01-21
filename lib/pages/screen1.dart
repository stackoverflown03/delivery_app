import 'package:flutter/material.dart';
import 'package:food_delivery/pages/screen2.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('Imgs/img.png'),
              ),
              Text("#1",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 75,
                fontWeight: FontWeight.bold
              ),),
              Text("World's Best Food ordering App",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,),
              Text("We are awarded the best food ordering app worldwide",
              style: TextStyle(
                fontSize: 20
              ),
              textAlign: TextAlign.center,),
              ElevatedButton(onPressed:(){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange
                  )
                  ,child: Text("Get Started now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),))
            ],
          ),
        )
      )
    );
  }
}
