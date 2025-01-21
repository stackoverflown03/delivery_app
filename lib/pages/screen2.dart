import 'package:flutter/material.dart';
import 'package:food_delivery/pages/screen3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(onPressed: (){},
            icon: Icon(Icons.arrow_back_ios,)),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.shopping_cart_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black
                  ),
                  color: Colors.orange
                ),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top:10,
                      left: 10,
                      child:
                    Text("50%",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),),
                    Positioned(
                      top: 5,
                      left: 180,
                      child:Image(image: AssetImage("Imgs/img_12.png"),
                      width: 250,
                      height: 175,
                    ),
                    ),
                    Positioned(
                        top: 75,
                        left: 10,
                        child: Text("Offer is only for \ntoday.So place \nyour order right now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20
                        ),
                        ),
                    ),
                    Positioned(
                        top: 175,
                        left:10,
                        child:  ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen()));
                        }, child:Text("Order now",
                        style: TextStyle(
                          color: Colors.white
                        ),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black26,
                        )),
                    )
                  ],
                ),
              ),
            ),
            Text("Popular Items",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
            ),
            Expanded(
              child:
              Padding(padding: EdgeInsets.all(15),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                      return SizedBox(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Column(
                              children: [
                                Container(
                                    child: Image(image: AssetImage('Imgs/img_$index.png')),
                                height:65,
                                    width: 200,),
                                Text("Double Layer Burger",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12
                                ),
                                  textAlign: TextAlign.left,
                                ),
                                Text("Double Layer Burger Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor ",
                                style: TextStyle(
                                  fontSize: 8
                                ),),
                               Align(
                                 alignment: Alignment.centerLeft,
                                 child: ElevatedButton(onPressed: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen()));
                                 },
                                   child: Text("Order now",
                                     style: TextStyle(
                                         fontSize:8.5,
                                         color: Colors.black
                                     ),),
                                   style: ElevatedButton.styleFrom(
                                     backgroundColor: Colors.amber,
                                     padding: EdgeInsets.only(
                                       top: 2,
                                       bottom: 2,
                                     )
                                   ),
                                 ),
                               )
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius:BorderRadius.circular(10)
                          ),
                        ),
                      );
                    },
                      childCount: 4,
                    ),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.80,
                        mainAxisExtent: 231)
                    ),
                  ],
                ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
