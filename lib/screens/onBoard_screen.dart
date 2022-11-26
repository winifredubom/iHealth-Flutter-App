import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ihealth/data.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  CarouselController _carouselController = CarouselController();
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            CarouselSlider(
                carouselController: _carouselController,
                items: data.map((e) {
                  return Image.asset(e ['image'], width: double.infinity, fit: BoxFit.contain);}).toList(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  onPageChanged: (index, _){
                    setState(() {
                      currentSlider = index;
                    });
                  }

                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(30),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40))
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}

