class item{
  String Path;
  double price;
  String Location;
  String name;
  item({required this.Path,required this.price,this.Location = "main branch",required this.name});
}
final List items = [
  item(name: "Product 1", Path: "images/T-Shirt.jpeg", price: 12.99,Location:"Anwar Shop"),
  item(name: "T-Shirt Style", Path: "images/T-Shirt-style.jpeg", price: 13.99),
  item(name: "Product 3", Path: "images/janes.jpeg", price: 17.99),
  item(name: "Product 4", Path: "images/shoes.jpeg", price: 20.75),
  item(name: "Product 5", Path: "images/makeup.jpeg", price: 15.75),
  item(name: "Product 6", Path: "images/prefume.jpeg", price: 26.62),
  item(name: "Product 7", Path: "images/small.jpeg", price: 32.5),
  item(name: "Product 8", Path: "images/socks.jpeg", price: 14),
];