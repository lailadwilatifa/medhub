class CarrouselModel {
  final String title, subtitle, image;

  CarrouselModel({
    required this.title,
    required this.subtitle,
    required this.image
  });
}

final List<CarrouselModel> dataCarrousel = [
  CarrouselModel(title: 'Save extra on\nevery order', subtitle: 'Etiam mollis metus\nnon faucibus.', image: 'assets/bg_carrousel.png'),
  CarrouselModel(title: 'Nulla facilisi.\nSed tincidunt', subtitle: 'ligula non\nlacus pretium.', image: 'assets/bg_carrousel.png'),
  CarrouselModel(title: 'Curabitur ac felis\nvel nisi', subtitle: 'aliquam congue.', image: 'assets/bg_carrousel.png'),
];