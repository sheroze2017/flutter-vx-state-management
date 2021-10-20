import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class catalogHeader extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(Colors.blue).make(),
        "WE SALE WHAT YOU DESERVE".text.make(),
      ],
    );
  }
}
