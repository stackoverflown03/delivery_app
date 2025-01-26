class ProductDetails{
final String Name;
final String id;
final int price;
final String imageurl;

ProductDetails({
  required this.Name,
  required this.id,
  required this.imageurl,
  required this.price,
});
}

List<ProductDetails> prod=[
  ProductDetails(Name: "Food1", id: "001", imageurl: "Imgs/img_0", price: 150),
  ProductDetails(Name: "Food2", id: "002", imageurl: "Imgs/img_1", price: 200),
  ProductDetails(Name: "Food3", id: "003", imageurl: "Imgs/img_2", price: 350),
  ProductDetails(Name: "Food4", id: "004", imageurl: "Imgs/img_3", price: 400)
];

