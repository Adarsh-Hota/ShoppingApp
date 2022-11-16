import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:your_shop_app/constants/global_variables.dart';

class CarouselImageBox extends StatelessWidget {
  const CarouselImageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages
          .map(
            (imageLink) => Image.network(
              imageLink,
              height: 200,
              fit: BoxFit.cover,
            ),
          )
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
