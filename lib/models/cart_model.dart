class CartModel {
  final String name, price, desc, image;

  CartModel(
      {required this.name,
      required this.price,
      required this.desc,
      required this.image});
}

final List<CartModel> dataCart = [
  CartModel(name: 'Sugar free gold', price: 'Rp 25.000', desc: 'bottle of 500 pellets', image: 'assets/img_diabeticdiet2.png'),
  CartModel(name: 'Sugar free gold', price: 'Rp 18.000', desc: 'bottle of 500 pellets', image: 'assets/img_diabeticdiet3.png'),
];