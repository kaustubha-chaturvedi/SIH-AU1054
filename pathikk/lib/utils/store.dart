// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pathikk/utils/DislikedModel.dart';
import 'package:pathikk/utils/LikedModel.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:velocity_x/velocity_x.dart';

class appstore extends VxStore {
  late famous_catalog things;
  late likedModel liked;
  late dislikedModel disliked;

  appstore() {
    things = famous_catalog();
    liked = likedModel();
    disliked = dislikedModel();
    liked.thing = things;
    disliked.thing = things;
  }
}
