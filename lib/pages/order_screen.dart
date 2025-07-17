import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/pages/data/cart_details.dart';
import 'package:food_delivery/pages/details_screen.dart';
import 'package:food_delivery/pages/loading_cubit.dart';

class OrderPage extends StatefulWidget {
  OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quant = 1;
  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        final loadingCubit = context.read<LoadingCubit>();
    Future.delayed(Duration(seconds: 3), () {
      loadingCubit.hideLoading();
    });
  });
  }

  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, LoadingState>(builder: (context, state) {
      if (state is LoadingShown) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state is LoadingHidden) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>  DetailScreen()));
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              centerTitle: true,
              title: Text("Order Here"),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.search),
                )
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              cart.isEmpty
                  ? Center(child: Text("No Products Added !"))
                  : Expanded(
                    child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("${cart[index].product.name}"),
                          leading: Image.asset(
                              "${cart[index].product.imageurl}"),
                          subtitle: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cart[index].quantity++;
                                    });
                                  },
                                  icon: Icon(Icons.add_circle)),
                              Text("${cart[index].quantity}"),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cart[index].quantity--;
                                    });
                                  },
                                  icon: Icon(Icons.remove_circle))
                            ],
                          ),
                          trailing: Text(
                              "${(cart[index].product.price)*(cart[index].quantity)}"),
                        ),
                      );
                    }),
                  ),
            ]));
      }
      return Container();
    });
  }
}
