import 'package:flutter/material.dart';
import 'package:practise1/pages/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:practise1/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            AddToCart(catalog: catalog).wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl2.bold.make(),
                          catalog.desc.text.xs.make(),
                          10.heightBox,
                          "Mihi duco adfero, puer pasco homo aduro missa. Tametsi esse pia illa, renuo uter. Premo picea. Loci letum demum abbas ceterum puteus suu."
                              .text
                              // .minFontSize(12)
                              .maxFontSize(12)
                              .wordSpacing(0.4)
                              .fontWeight(FontWeight.w200)
                              .make()
                              .px4()
                          // .p16(),
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
