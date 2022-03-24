import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Card(
          color: Color.fromARGB(255, 39, 34, 34),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(0, 39, 34, 0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage((things.images != null && things.images != "")
                        ? 'https://res.cloudinary.com/sihau1054/${things.images}'
                        : 'https://res.cloudinary.com/sihau1054/image/upload/v1648141871/eee_k6kbyq.png')),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(things.name.toString())
                    .text
                    .bold
                    .color(Colors.yellow)
                    .make(),
                Text(location.locs).text.color(Colors.yellow).make(),
                Wrap(
                  spacing: 12.0,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 4.0,
                      children: [
                        Icon(Icons.thumb_up_alt_rounded),
                        Text(things.likes.length.toString()).text.bold.make(),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 4.0,
                      children: [
                        Icon(Icons.thumb_down_alt_rounded),
                        Text(things.dislikes.length.toString())
                            .text
                            .bold
                            .make(),
                      ],
                    ),
                  ],
                ),
                (things.description != null && things.description != "")
                    ? Html(data: things.description)
                    : Text("No description").text.color(Colors.yellow).make(),
              ],
            ))
          ])),
    );
  }
}
