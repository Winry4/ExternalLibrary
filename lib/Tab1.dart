import 'package:flutter/material.dart';

import 'Screen/Details.dart';

void onclick(int number, BuildContext context, Image pokeImage) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => Details(
              number: number.toString(),
              pokeImage: pokeImage,
            )),
  );
}

class Tab1 extends StatelessWidget {
  Widget build(BuildContext context) {
    var image1 =
        Image(image: AssetImage('assets/images/17.png'), fit: BoxFit.fill);
    var image2 =
        Image(image: AssetImage('assets/images/25.png'), fit: BoxFit.fill);
    var image3 =
        Image(image: AssetImage('assets/images/59.png'), fit: BoxFit.fill);

    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(height: 25.0),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height / 2,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => onclick(17, context, image1),
                child: image1,
              )),
        ),
        SizedBox(height: 25.0),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onclick(25, context, image2),
              child: image2,
            ),
          ),
        ),
        SizedBox(height: 25.0),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onclick(59, context, image3),
              child: image3,
            ),
          ),
        ),
        SizedBox(height: 15.0)
      ],
    ));
  }
}
