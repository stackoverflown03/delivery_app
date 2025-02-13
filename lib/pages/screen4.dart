import 'package:flutter/material.dart';
import 'package:food_delivery/Product_Details.dart';
import 'package:food_delivery/pages/screen2.dart';
import 'package:food_delivery/pages/screen3.dart';

class OrderPage extends StatefulWidget {

  const OrderPage({super.key}) ;
  @override
  State<OrderPage> createState() => _OrderPageState();
}

int qty=0;
class _OrderPageState extends State<OrderPage> {

  @override
  Widget build(BuildContext context) {
    final productdetails=ProductDetails.prod;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
        }, icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text("Product Details"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body:
          ListView.builder(
            itemCount: productdetails.length,
              itemBuilder: (context,index){
              final product=productdetails[index];
              return ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: Text(product.Name),
                subtitle:Text("Price: "+(product.price).toString()),
                leading: Image(image: AssetImage(product.imageurl),
                height: 100,
                width: 150),
              );
              })
    );
  }
}
