import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/details_screen.dart';
import 'package:food_delivery/pages/login_screen.dart';
import 'package:food_delivery/pages/order_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<void> logout() async {
  await FirebaseAuth.instance.signOut();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderPage()));
              },
              icon: Icon(Icons.shopping_cart_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 85,
              child: DrawerHeader(
                child: Text(
                  "Welcome !",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            ListTile(
              title: Text("Sign in"),
              onTap: () {
                if(FirebaseAuth.instance.currentUser==null){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                }
                else{
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User already logged in")));
                }
              },
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Orders Screen"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderPage()));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Details Screen"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailScreen()));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Sign Out"),
              onTap: () async {
                await logout();
                User? user = FirebaseAuth.instance.currentUser;
                if (user == null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("User Signed out")));
                }
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.orange, Colors.white]),
                  border: Border.all(color: Colors.black),
                ),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Text(
                        "50%",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 180,
                      child: Image(
                        image: AssetImage("Imgs/img_12.png"),
                        width: 250,
                        height: 175,
                      ),
                    ),
                    Positioned(
                      top: 75,
                      left: 10,
                      child: Text(
                        "Offer is only for \ntoday.So place \nyour order right now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                    Positioned(
                      top: 175,
                      left: 10,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen()));
                          },
                          child: Text(
                            "Order now",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black26,
                          )),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "Popular Items",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return SizedBox(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(22.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Image(
                                            image: AssetImage(
                                                'Imgs/img_$index.png')),
                                        height: 65,
                                        width: 200,
                                      ),
                                      Text(
                                        "Double Layer Burger",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        "Double Layer Burger Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor ",
                                        style: TextStyle(fontSize: 8),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailScreen()));
                                          },
                                          child: Text(
                                            "Order now",
                                            style: TextStyle(
                                                fontSize: 8.5,
                                                color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.amber,
                                              padding: EdgeInsets.only(
                                                top: 2,
                                                bottom: 2,
                                              )),
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
                                    borderRadius: BorderRadius.circular(10)),
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
                            mainAxisExtent: 231)),
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
