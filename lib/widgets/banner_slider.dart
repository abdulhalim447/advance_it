import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              "assets/images/s_banner1.svg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),

        //2nd Image of Slider
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              "assets/images/s_banner2.svg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),

        //3rd Image of Slider
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              "assets/images/s_banner3.svg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              "assets/images/uddokta_banner.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              "assets/images/fridaymart.svg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              "assets/images/newshub.svg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              "assets/images/mediahub.svg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        height:
            MediaQuery.of(context).size.height *
            0.2, // Responsive height based on screen size
        enlargeCenterPage: false,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1.0,
      ),
    );
  }
}
