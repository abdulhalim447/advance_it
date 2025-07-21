import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          margin: const EdgeInsets.only(left: 6.0, right: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage("assets/images/slider1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //2nd Image of Slider
        Container(
          margin: const EdgeInsets.only(left: 6.0, right: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/slider2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //3rd Image of Slider
        Container(
          margin: const EdgeInsets.only(left: 6.0, right: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/slider3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(left: 6.0, right: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/slider4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(left: 6.0, right: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/slider5.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(left: 6.0, right: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/slider6.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        height: 310.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
