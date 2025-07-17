class ProductDetails {
  final String name;
  final String id;
  final int price;
  final String imageurl;
  ProductDetails({
    required this.name,
    required this.id,
    required this.imageurl,
    required this.price,
  });
  static final List<ProductDetails> prod=[
    ProductDetails(
        name: "Food1", id: "1", imageurl: "Imgs/img_1.png", price: 150),
    ProductDetails(
        name: "Food2", id: "2", imageurl: "Imgs/img_2.png", price: 200),
    ProductDetails(
        name: "Food3", id: "3", imageurl: "Imgs/img_3.png", price: 350),
    ProductDetails(
        name: "Food4", id: "4", imageurl: "Imgs/img_0.png", price: 400)
  ];
}