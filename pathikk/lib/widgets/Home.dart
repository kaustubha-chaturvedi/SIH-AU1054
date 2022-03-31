import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pathikk/widgets/Homewids.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:pathikk/widgets/search.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/store.dart';
import 'MainDrawer.dart';
import 'package:pathikk/utils/LikedModel.dart';
import 'package:pathikk/utils/DislikedModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

//loading data from json files/apis

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    const url_items = "http://localhost:8000/api/famous/";
    const url_locations = "http://localhost:8000/api/location/";

    var response = await http.get(Uri.parse(url_items));
    var jsoitem = response.body;
    var item_data = jsonDecode(jsoitem);

    var response2 = await http.get(Uri.parse(url_locations));
    var jsolocation = response2.body;
    var locs_data = jsonDecode(jsolocation);

    famous_catalog.fitems = List.from(item_data)
        .map<fam_Items>((items) => fam_Items.fromMap(items))
        .toList();

    astd_location.flocs = List.from(locs_data)
        .map<locations>((locationx) => locations.fromMap(locationx))
        .toList();
    setState(() {});
  }

// main frontend widget//
  final _cart = (VxState.store as appstore);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pathik"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: customsearchdelegate());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            if (famous_catalog.fitems[0].id != "default")
              Itemlister().expand()
            else
              const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
