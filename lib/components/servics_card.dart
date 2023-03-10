import 'package:flutter/cupertino.dart';

import '../constant.dart';

class ServiceCard extends StatelessWidget {
  double Width;
  double Height;
  String ImageAssetsLink;
  double? ImageSize;
  String CardName;
  final Function() OnTap;

  ServiceCard({
    required this.Width,
    required this.Height,
    required this.CardName,
    required this.ImageAssetsLink,
    required this.OnTap(),
    this.ImageSize,

  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.OnTap,
      child: Container(

        width: this.Width, //MediaQuery.of(context).size.width * .45,
        height: this.Height, //MediaQuery.of(context).size.height * .20,
        decoration: BoxDecoration(
          color: Color4,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Color2,
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              this.ImageAssetsLink,
              fit: BoxFit.contain,
              width:this.ImageSize ?? this.Width *.5,),
            Text(this.CardName, style: TextStyle(fontSize:20 , color: Color1),)
          ],
        ),
      ),
    );
  }
}

