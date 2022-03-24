import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathikk/widgets/Homewids.dart';
import 'package:pathikk/widgets/model.dart';
import 'package:pathikk/widgets/search.dart';
import 'package:velocity_x/velocity_x.dart';
import 'MainDrawer.dart';

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
    //loading from json file
    // var jsoitem = await rootBundle.loadString("assets/data.json");
    // var item_data = jsonDecode(jsoitem);

    const url_items = "http://localhost:8000/api/famous/";

    var response = await http.get(Uri.parse(url_items));
    var jsoitem = response.body;
    var item_data = jsonDecode(jsoitem);

    var jsolocs = await rootBundle.loadString("locdata.json");
    var locs_data = jsonDecode(jsolocs);

    famous_catalog.fitems = List.from(item_data)
        .map<fam_Items>((items) => fam_Items.fromMap(items))
        .toList();

    astd_location.flocs = List.from(locs_data)
        .map<locations>((locationx) => locations.fromMap(locationx))
        .toList();

    setState(() {});
  }

// main frontend widget//

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
          children: [const listheader(), Itemlister().expand()],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
