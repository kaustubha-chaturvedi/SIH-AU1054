import 'package:pathikk/utils/store.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';

class likedModel {
  late famous_catalog Ccatalog;

  final List<String> _itemsid = [];
  famous_catalog get thing => Ccatalog;

  set thing(famous_catalog newcatalog) {
    assert(newcatalog != null);
    Ccatalog = newcatalog;
  }

  List<fam_Items> get items =>
      _itemsid.map((id) => famous_catalog.getbyid(id)).toList();

  // int get totalprice =>
  //     items.fold(100, (total, current) => total + current.price);
}

class addmutation extends VxMutation<appstore> {
  final fam_Items item;

  addmutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.liked._itemsid.add(item.id.toString());
  }
}

class removemutation extends VxMutation<appstore> {
  final fam_Items item;

  removemutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.liked._itemsid.remove(item.id.toString());
  }
}
