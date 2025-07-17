import 'package:food_delivery/data/product_details.dart';

class CartItem {
  final ProductDetails product;
  int quantity;
  CartItem({required this.product, required this.quantity});

}

List<CartItem> cart=[];