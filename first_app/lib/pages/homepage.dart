import 'package:first_app/models/catalogs.dart';
import 'package:first_app/pages/home_detail_page.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:first_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
   var catalogJson = await rootBundle.loadString("assets/files/catalogs.json");
   var decodedData = jsonDecode(catalogJson);
   var productsData = decodedData["devices"];
   CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
   setState(() {

   });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator(),)
            ],
          ),
        ),
      )

    );
  }
}

class CatalogList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context , index){
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailPage(catalog: catalog)),),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.make(),
        "Trending Products".text.xl2.make()
      ],


    );
  }
}

class CatalogItem extends StatelessWidget {
    final Item catalog;
    const CatalogItem({super.key, required this.catalog}):
    assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(child:

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.xl.bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              OverflowBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: (){}, child: "Buy".text.make())
                ],
              ).pOnly(right: 8)
            ],
          ))

        ],
      )
    ).white.roundedLg.square(150).make().py12();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.p8.color(Colors.white54).make().p12().w40(context);
  }
}
