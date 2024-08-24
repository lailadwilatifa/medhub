class OnBoardModel {
  final String image, title, description;

  OnBoardModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoardModel> dataOnboard = [
  OnBoardModel(
      image: 'assets/img_onboard1.png',
      title: 'View and buy\nMedicine online',
      description:
          'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.'),
  OnBoardModel(
      image: 'assets/img_onboard2.png',
      title: 'Online medical\n& Healthcare',
      description:
          'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.')
];
