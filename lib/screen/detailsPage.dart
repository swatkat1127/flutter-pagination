import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String photographerName;
  final String photographerUrl;
  final num photographerId;
  final String avgColor;
  final String image;

  DetailsPage({
    required this.photographerName,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.00),
                  height: 400,
                  child: ClipRRect(
                    child: Image(
                      image: NetworkImage(image),
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white70,
                  margin: EdgeInsets.symmetric(vertical: 1, horizontal: 20.0),
                  child: ListTile(
                    title: Text(
                      'Photographer',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.00,
                      ),
                    ),
                    subtitle: Text(
                      photographerName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.00,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white70,
                  margin:
                      EdgeInsets.symmetric(vertical: 1.00, horizontal: 20.0),
                  child: ListTile(
                    title: Text(
                      'photo url',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.00,
                      ),
                    ),
                    subtitle: Text(
                      photographerUrl,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.00,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white70,
                  margin:
                      EdgeInsets.symmetric(vertical: 1.00, horizontal: 20.0),
                  child: ListTile(
                    title: Text(
                      'photographer id',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.00,
                      ),
                    ),
                    subtitle: Text(
                      '$photographerId',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.00,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white70,
                  margin:
                      EdgeInsets.symmetric(vertical: 1.00, horizontal: 20.0),
                  child: ListTile(
                    title: Text(
                      'avg color',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.00,
                      ),
                    ),
                    subtitle: Text(
                      avgColor,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.00,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
