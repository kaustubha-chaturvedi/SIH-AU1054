import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Item_desc.dart';

class listheader extends StatelessWidget {
  const listheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pathik").text.bold.xl5.make(),
        Text("for making best memories").text.make(),
      ],
    );
  }
}

class Itemlister extends StatelessWidget {
  const Itemlister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: famous_catalog.fitems.length,
      itemBuilder: (BuildContext context, int index) {
        final fam_Items things = famous_catalog.fitems[index];
        locations location = astd_location.flocs[0];
        for (var a in astd_location.flocs) {
          if (things.location == a.id) {
            location = a;
          }
        }
        ;
        return listcard1(things: things, location: location);
      },
    );
  }
}

class listcard1 extends StatelessWidget {
  final things;
  final locations location;
  const listcard1({Key? key, required this.things, required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => descwid(
                    things: things,
                  ))),
      child: Card(
          shape: StadiumBorder(),
          child: Row(children: [
            things.images != null
                ? Image.network(
                        "https://media-cdn.tripadvisor.com/media/photo-s/0f/1b/1d/44/view-from-boat.jpg")
                    .box
                    .make()
                    .p8()
                    .w20(context)
                    .clipOval()
                : Image.network(
                        "https://media.istockphoto.com/vectors/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-vector-id1128826884?k=20&m=1128826884&s=170667a&w=0&h=_cx7HW9R4Uc_OLLxg2PcRXno4KERpYLi5vCz-NEyhi0=")
                    .box
                    .make()
                    .p8()
                    .w20(context),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(things.name.toString())
                    .text
                    .bold
                    .color(Colors.blue)
                    .make(),
                Text(location.locs).text.color(Colors.lightBlue).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(things.likes.toString()).text.bold.make(),
                  ],
                )
              ],
            ))
          ])),
    );
  }
}
