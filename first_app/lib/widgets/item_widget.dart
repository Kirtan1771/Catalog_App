import 'package:flutter/material.dart';

import '../models/catalogs.dart';


class ItemWidget extends StatelessWidget {

  final Item item;
  const ItemWidget({super.key, required this.item});
  @override

  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: (){
            print("${item.name} clicked!");
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text("\$${item.price}",
          style: TextStyle(
              fontSize: 20
          ),),
      
      
        ),
    );

  }
}

