import 'package:pathikk/utils/store.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';

class dislikedModel {
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

class adddismutation extends VxMutation<appstore> {
  final fam_Items item;

  adddismutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.disliked._itemsid.add(item.id.toString());
  }
}

class removedismutation extends VxMutation<appstore> {
  final fam_Items item;

  removedismutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.disliked._itemsid.remove(item.id.toString());
  }
}
