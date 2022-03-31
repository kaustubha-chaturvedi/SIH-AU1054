import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathikk/utils/LikedModel.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'store.dart';

class addtoliked extends StatelessWidget {
  final fam_Items thing;
  addtoliked({Key? key, required this.thing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [addmutation, removemutation]);
    final _cart = (VxState.store as appstore).liked;
    bool isincart = _cart.items.contains(thing) ? true : false;
    return ElevatedButton(
        onPressed: () {
          if (!isincart) {
            addmutation(thing);
            print("added");
          } else {
            removemutation(thing);
          }
        },
        child: isincart
            ? Icon(CupertinoIcons.hand_thumbsup_fill)
            : Icon(CupertinoIcons.hand_thumbsup));
  }
}
