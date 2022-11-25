import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: IntroductionScreen(
        pages: [
          PageViewModel(
            title:'Find Pharmacy near you',
            body: 'it\'s easy to find pharmacy that is near to your location',
            image: Image.asset('images/find_a_pharmacy_near_you.jpg'),
          ),
          PageViewModel(
            title:'Search with our database',
            body: 'Find the nearest pharmacy close to you',
            image: Image.asset('images/pharmacy_finder.jpg') ,
          ),
          PageViewModel(
            title:'Get delivery to your Doorstep',
            body: 'Get your drugs delivered to your doorstep' ,
            image: Image.asset('images/medicine_delivery.png'),
          ),

        ], //onDone: onDone, done: done
     ));


  }
}

