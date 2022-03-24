import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';

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

        return listcard1(things: things);
      },
    );
  }
}

class listcard1 extends StatelessWidget {
  final things;
  // final locations locationid = astd_location.flocs;
  const listcard1({Key? key, required this.things}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[50],
      shadowColor: Colors.blue[100],
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Column(
            children: [
              Text(things.name),
              // if (things.location == locationid.id)
              // Text(locationid.locs.toString()).expand()
            ],
          ),
          trailing: Icon(Icons.map),
        ),
        // child: Column(children: [Text(things.name)]),
      ),
    );
  }
}
