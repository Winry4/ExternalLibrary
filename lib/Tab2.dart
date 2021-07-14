import 'package:flutter/material.dart';

import 'Screen/DetailsBalls.dart';

void onclick(String name, BuildContext context, Image pokeImage) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DetailsBalls(
              name: name,
              pokeImage: pokeImage,
            )),
  );
}

class Tab2 extends StatelessWidget {
  var image1 =
      Image(image: AssetImage('assets/images/Poke_Ball.png'), fit: BoxFit.fill);
  var image2 = Image(
      image: AssetImage('assets/images/Ultra_Ball.png'), fit: BoxFit.fill);
  var image3 = Image(
      image: AssetImage('assets/images/Safari_Ball.png'), fit: BoxFit.fill);

  Widget build(BuildContext context) {
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
                onTap: () => onclick('poke-ball', context, image1),
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
              onTap: () => onclick('ultra-ball', context, image2),
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
              onTap: () => onclick('safari-ball', context, image3),
              child: image3,
            ),
          ),
        ),
        SizedBox(height: 15.0)
      ],
    ));
  }
}
