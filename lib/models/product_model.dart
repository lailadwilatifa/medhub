class ProductModel {
  final String name, price, rating, image;
  final int disc;
  final bool isSale;

  ProductModel(
      {required this.name,
      required this.price,
      required this.rating,
      required this.image,
      this.disc = 0,
      this.isSale = false});
}

final List<ProductModel> dataDeals = [
  ProductModel(
      name: 'Accu-check Active Test Strip',
      price: 'Rp 112.000',
      rating: '4.2',
      image: 'assets/img_table_bottle_mockup1.png'),
  ProductModel(
      name: 'Accu-check Active Test Strip',
      price: 'Rp 112.000',
      rating: '4.2',
      image: 'assets/img_table_bottle_mockup2.png'),
  ProductModel(
      name: 'Accu-check Active Test Strip',
      price: 'Rp 112.000',
      rating: '4.2',
      image: 'assets/img_table_bottle_mockup1.png'),
];

final List<ProductModel> dataAllProducts = [
  ProductModel(
      name: 'Accu-check Active Test Strip',
      price: 'Rp 112.000',
      rating: '4.2',
      image: 'assets/img_allproducts1.png',
      isSale: true),
  ProductModel(
      name: 'Omron HEM-8712  BP Monitor',
      price: 'Rp 112.000',
      rating: '4.2',
      image: 'assets/img_allproducts2.png',
      disc: 15),
  ProductModel(
      name: 'Accu-check Active Test Strip',
      price: 'Rp 112.000',
      rating: '4.2',
      image: 'assets/img_allproducts3.png',
      disc: 15),
  ProductModel(
      name: 'Omron HEM-8712 BP Monitor',
      price: 'Rp 112.000',
      rating: '4.2',
      image: 'assets/img_allproducts4.png',
      disc: 15)
];

final List<ProductModel> dataFeatureBrands = [
  ProductModel(
      name: 'Himalaya\nWellness',
      price: '',
      rating: '',
      image: 'assets/img_featurebrands1.png'),
  ProductModel(
      name: 'Accu-Chek',
      price: '',
      rating: '',
      image: 'assets/img_featurebrands2.png'),
  ProductModel(
      name: 'Vlcc',
      price: '',
      rating: '',
      image: 'assets/img_featurebrands3.png'),
  ProductModel(
      name: 'Protinex',
      price: '',
      rating: '',
      image: 'assets/img_featurebrands4.png'),
];

final List<ProductModel> dataDiebaticDiet = [
  ProductModel(
      name: 'Sugar\nSubstitute',
      price: '',
      rating: '',
      image: 'assets/img_diabeticdiet1.png'),
  ProductModel(
      name: 'Juices &\nVinegars',
      price: '',
      rating: '',
      image: 'assets/img_diabeticdiet2.png'),
  ProductModel(
      name: 'Vitamins\nMedicines',
      price: '',
      rating: '',
      image: 'assets/img_diabeticdiet3.png')
];

final List<ProductModel> dataProfile = [
  ProductModel(
      name: 'Private Account',
      price: '',
      rating: '',
      image: 'assets/ic_profile1.png'),
  ProductModel(
      name: 'My Consults',
      price: '',
      rating: '',
      image: 'assets/ic_profile2.png'),
  ProductModel(
      name: 'My orders',
      price: '',
      rating: '',
      image: 'assets/ic_profile3.png'),
  ProductModel(
      name: 'My orders',
      price: '',
      rating: '',
      image: 'assets/ic_profile3.png'),
  ProductModel(
      name: 'Billing', price: '', rating: '', image: 'assets/ic_profile4.png'),
  ProductModel(
      name: 'Faq', price: '', rating: '', image: 'assets/ic_profile5.png'),
  ProductModel(
      name: 'Settings', price: '', rating: '', image: 'assets/ic_profile6.png')
];

final List<ProductModel> dataPackageSize = [
  ProductModel(
      name: '500 pellets',
      price: '252.000',
      rating: '',
      image: 'assets/ic_profile1.png'),
  ProductModel(
      name: '110 pellets',
      price: '100.000',
      rating: '',
      image: '='),
  ProductModel(
      name: '300 pellets',
      price: '160.000',
      rating: '',
      image: '')
];

final List<String> dataCarrouselProductDetail = [
  'assets/img_allproducts1.png',
  'assets/img_allproducts2.png',
  'assets/img_allproducts3.png'
];