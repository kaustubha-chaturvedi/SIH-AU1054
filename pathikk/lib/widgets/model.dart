// ignore_for_file: public_member_api_docs, sort_constructors_first
class fam_Items {
  final int id;
  final int category;
  final String name;
  final dynamic images;
  final int location;
  final List likes;
  final List dislikes;

  fam_Items({
    required this.id,
    required this.category,
    required this.name,
    required this.images,
    required this.location,
    required this.likes,
    required this.dislikes,
  });

  factory fam_Items.fromMap(Map<String, dynamic> map) {
    return fam_Items(
        id: map["id"],
        category: map["category"],
        name: map["item"],
        location: map["location"],
        likes: map["like"],
        dislikes: map["dislike"],
        images: map["images"]);
  }
}

class famous_catalog {
  static List<fam_Items> fitems = [
    fam_Items(
        id: 0,
        category: 2,
        name: "lwda",
        location: 3,
        likes: [1, 2, 3],
        dislikes: [4, 5, 6],
        images:
            'https://media.istockphoto.com/vectors/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-vector-id1128826884?k=20&m=1128826884&s=170667a&w=0&h=_cx7HW9R4Uc_OLLxg2PcRXno4KERpYLi5vCz-NEyhi0=')
  ];
}

class locations {
  final int id;
  final String locs;

  locations({required this.id, required this.locs});

  factory locations.fromMap(Map<String, dynamic> map) {
    return locations(id: map["id"], locs: map["location"]);
  }
}

class astd_location {
  static List<locations> flocs = [locations(id: 0, locs: '2')];
}
