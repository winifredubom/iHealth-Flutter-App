import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ihealth/data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  int currentSlider = 0;
  final CarouselController _carouselController = CarouselController();

  List<Widget> generateImageTiles(){
    return images.map((element) => ClipRRect(
        child: Image.asset(element, fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15)

    )).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 100),
        child: Stack(
          children: [
            CarouselSlider(items: generateImageTiles(), options: CarouselOptions(
                enlargeCenterPage: true,
                aspectRatio: 18/15,
                enableInfiniteScroll: false,
                initialPage: 0,
                onPageChanged: (index, _){
                  setState(() {
                    currentSlider = index;
                  });
                }
            ),),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(left: 40, top: 10, right: 30),
                height: 330,
                child: Column(
                  children: [
                    Text(title[currentSlider],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 20,),
                    Text(body[currentSlider],
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,)),
                  ],
                ),
              ),
            ),
            CarouselIndicator(activePage: currentSlider),

          ],
        ),
      ),
    );
  }
}
class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({Key? key, required this.activePage}) : super(key: key);

  final int activePage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Positioned(
            left: 45,
            bottom: 130,
            child: Container(
              height: 4,
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [0,1,2].map((e) {
                  return Container(
                    height: 4,
                    width: (e == activePage ) ? 18 : 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: (e == activePage) ? Color(0xff6686D8): Color(0xffCBD6F3)
                    ),
                  );
                }).toList(),
              ),
            )),
      ],
    );
  }
}
