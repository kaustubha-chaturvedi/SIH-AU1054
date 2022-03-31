import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'store.dart';
import 'package:pathikk/utils/LikedModel.dart';
import 'package:pathikk/utils/DislikedModel.dart';

class cartx extends StatelessWidget {
  const cartx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart').text.make()),
      body: Column(
        children: [cartlist().expand(), Divider(), _carttotal()],
      ),
    );
  }
}

class _carttotal extends StatelessWidget {
  final _cart = (VxState.store as appstore).liked;
  _carttotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('not available')));
              },
              child: Text("Direction").text.make())
        ],
      ),
    );
  }
}

class cartlist extends StatelessWidget {
  cartlist({Key? key}) : super(key: key);

  final _cart = (VxState.store as appstore).liked;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [removemutation]);
    return _cart.items.isEmpty
        ? "Nothing here to show".text.make()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () => removemutation(_cart.items[index])),
                  title: Text(_cart.items[index].name));
            },
          );
  }
}
