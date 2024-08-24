import 'package:flutter/material.dart';

class CategoryModel {
  final String image, title;
  final List<Color> gradient;

  CategoryModel({
    required this.image,
    required this.title,
    required this.gradient,
  });
}

final List<CategoryModel> dataCategory = [
  CategoryModel(
    image: 'assets/ic_dental.png',
    title: 'Dental',
    gradient: <Color>[
      const Color(0xffFF9598),
      const Color(0xffFF70A7),
    ],
  ),
  CategoryModel(
    image: 'assets/ic_wellness.png',
    title: 'Wellness',
    gradient: <Color>[
      const Color(0xff19E5A5),
      const Color(0xff15BD92),
    ],
  ),
  CategoryModel(
    image: 'assets/ic_homeo.png',
    title: 'Homeo',
    gradient: <Color>[
      const Color(0xffFFC06F),
      const Color(0xffFF793A),
    ],
  ),
  CategoryModel(
    image: 'assets/ic_eyecare.png',
    title: 'Eye Care',
    gradient: <Color>[
      const Color(0xff4DB7FF),
      const Color(0xff3E7DFF),
    ],
  ),
  CategoryModel(
    image: 'assets/ic_skinhair.png',
    title: 'Skin & Hair',
    gradient: <Color>[
      const Color(0xff828282),
      const Color(0xff090F47),
    ],
  ),
  CategoryModel(
    image: 'assets/ic_eyecare.png',
    title: 'Eye Care',
    gradient: <Color>[
      const Color(0xff4DB7FF),
      const Color(0xff3E7DFF),
    ],
  ),
];
