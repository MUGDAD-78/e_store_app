// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  String title;
  String image;
  GridViewWidget({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          subtitle: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontFamily: "NormalFont", fontSize: 20),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -10,
              bottom: -20,
              right: 0,
              left: 0,
              child:Container(
                margin: const EdgeInsets.all(15),
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                         image),
                      fit: BoxFit.fill),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ],
        ));
  }
}
