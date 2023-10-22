// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, must_be_immutable

import 'package:e_store_app/constant/colors.dart';
import 'package:e_store_app/models/item_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  ItemModel itemFormAotherPage;
  DetailsPage({super.key, required this.itemFormAotherPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black, fontFamily: "BoldFont"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          itemFormAotherPage.category!.image.toString()),
                      fit: BoxFit.fill),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                itemFormAotherPage.description.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'NormalFont',
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
