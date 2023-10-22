// ignore_for_file: prefer_const_constructors, avoid_print, iterable_contains_unrelated_type

import 'package:e_store_app/constant/colors.dart';
import 'package:e_store_app/models/item_model.dart';
import 'package:e_store_app/pages/details.dart';
import 'package:e_store_app/services/item_services.dart';
import 'package:e_store_app/shared/grid_view_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiItemServices _reslutsList = ApiItemServices();
  final List<String> categories = [
    'Furniture',
    'Electronics',
    'Shoes',
    'Clothes',
    'Others'
  ];
  List<String> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    final filtercategories = _reslutsList.results.where((item) {
      return selectedCategories.isEmpty ||
          selectedCategories.contains(item.category!.name);
    }).toList();
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "E-Store",
            style: TextStyle(fontFamily: 'BoldFont', color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: appBarColor),
      body: FutureBuilder<List<ItemModel>>(
          future: _reslutsList.getItem(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            }
            return Column(
              children: [
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: categories
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: FilterChip(
                                          backgroundColor: Colors.amberAccent,
                                          selected:
                                              selectedCategories.contains(e),
                                          label: Text(e),
                                          onSelected: (selected) {
                                            setState(() {
                                              if (selected) {
                                                selectedCategories.add(e);
                                              } else {
                                                selectedCategories.remove(e);
                                              }
                                            });
                                          }),
                                    ))
                                .toList()),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 /*width*/ / 2 /*hight*/,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 33),
                      itemCount: filtercategories.length,
                      itemBuilder: (BuildContext context, index) {
                        final categoryyy = filtercategories[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                    itemFormAotherPage:
                                        filtercategories[index]),
                              ),
                            );
                          },
                          child: GridViewWidget(
                            title: categoryyy.category!.name.toString(),
                            image: categoryyy.category!.image.toString(),
                          ),
                        );
                      }),
                ),
              ],
            );
          }),
    );
  }
}
