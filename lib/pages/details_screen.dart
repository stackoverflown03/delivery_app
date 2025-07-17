import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/pages/data/cart_details.dart';
import 'package:food_delivery/pages/home_screen.dart';
import 'package:food_delivery/pages/loading_cubit.dart';
import 'package:food_delivery/pages/order_screen.dart';
import 'package:food_delivery/pages/data/product_details.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  int id = 0;

  Widget build(BuildContext context) {
    final pro = ProductDetails.prod;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CarouselSlider.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int item, int pageindex) =>
                    Container(
                        child: Image(image: AssetImage("Imgs/img_$item.png"))),
                options: CarouselOptions(
                    height: 200,
                    onPageChanged: (index, reason) {
                      setState(() {
                        id = index;
                      });
                    }),
              ),
              Text(
                "${pro[id].name}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Price: ${pro[id].price}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
              Text(
                  "Popular Items Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cart.add(CartItem(product: pro[id], quantity: 1));
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BlocProvider(
                              create: (_) => LoadingCubit()..showLoading(), child: OrderPage())));
                },
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
