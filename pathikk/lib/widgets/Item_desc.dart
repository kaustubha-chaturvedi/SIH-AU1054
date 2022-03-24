import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';

class descwid extends StatelessWidget {
  final fam_Items things;
  const descwid({Key? key, required this.things}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(things.name),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://media-cdn.tripadvisor.com/media/photo-s/0f/1b/1d/44/view-from-boat.jpg",
              width: context.screenWidth,
            ).h32(context).wFull(context),
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 6,
                  // color: Colors.deepPurple[50],
                  child: Column(children: [
                    Text(things.name).text.bold.color(Vx.black).xl4.make(),
                    Html(data: things.description),
                  ]).py32(),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(CupertinoIcons.hand_thumbsup, size: 36),
                Text(things.likes.length.toString()).text.bold.make(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(CupertinoIcons.hand_thumbsdown, size: 36),
                Text(things.dislikes.length.toString()).text.bold.make(),
              ],
            ),
            const Icon(
              CupertinoIcons.map_fill,
              size: 36,
            )
          ],
        ));
  }
}
