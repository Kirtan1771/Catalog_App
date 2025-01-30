import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalogs.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)).h48(context),
            Expanded(child: VxArc(
              arcType: VxArcType.convey,
              height: 30,
              edge: VxEdge.top,

              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(

                  children: [
                    catalog.name.text.xl4.bold.make(),
                    catalog.desc.text.textStyle(context.captionStyle).lg.make()
                  ],
                ).pOnly(top: 50),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
