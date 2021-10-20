import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:practise1/models/catalog.dart';
import 'package:practise1/pages/home_detail_page.dart';

import 'catalogImage.dart';
import 'home_widgets/add_to_cart.dart';

class catalogList extends StatelessWidget {
  const catalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.isLandscape
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              // loading data on base of position
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalog: catalog,
                    ),
                  ),
                ),
                child: catalogItem(catalog: catalog),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              // loading data on base of position
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalog: catalog,
                    ),
                  ),
                ),
                child: catalogItem(catalog: catalog),
              );
            },
          );
  }
}

class catalogItem extends StatelessWidget {
  final Item catalog;
  final accent = "#2E4053";

  const catalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.make(),
            catalog.desc.text.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.make(),
                AddToCart(catalog: catalog),
              ],
            ).pOnly(right: 8.0)
          ],
        ).p(context.isMobile ? 0 : 16),
      ),
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(children: children2))
        .color(context.cardColor)
        .rounded
        .square(135)
        .make()
        .py16();
  }
}
