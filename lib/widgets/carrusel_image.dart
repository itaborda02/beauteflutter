import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://previews.123rf.com/images/john79/john791801/john79180100015/92680668-beauty-salon-and-hairdresser-for-women-symbol-.jpg?fj=1',
  'https://cms.modumb.com/storage/magazine/_800x422/soy-un-peluquero-de-exito-claves-para-conseguirlo-5051.jpg',
  'https://cms.modumb.com/storage/magazine/_800x422/soy-un-peluquero-de-exito-claves-para-conseguirlo-5051.jpg',
];

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10.0)),
          CarouselSlider(
              items: imgList
                  .map((item) => Container(
                        child: Center(
                            child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: 600,
                        )),
                      ))
                  .toList(),
              options: CarouselOptions(
                  autoPlay: true, aspectRatio: 2.0, enlargeCenterPage: true)),
        ],
      ),
    );
  }
}
