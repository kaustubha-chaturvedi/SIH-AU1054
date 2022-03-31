import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathikk/utils/LikedModel.dart';
import 'package:pathikk/utils/DislikedModel.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'store.dart';

class addtodisliked extends StatelessWidget {
  final fam_Items thing;
  addtodisliked({Key? key, required this.thing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [addmutation, removemutation]);
    final _cart = (VxState.store as appstore).disliked;
    bool isincart = _cart.items.contains(thing) ? true : false;
    return ElevatedButton(
        onPressed: () {
          if (!isincart) {
            adddismutation(thing);
            print("added");
          } else if (isincart) {
            removedismutation(thing);
          }
        },
        child: isincart
            ? Icon(CupertinoIcons.hand_thumbsdown_fill)
            : Icon(CupertinoIcons.hand_thumbsdown));
  }
}
