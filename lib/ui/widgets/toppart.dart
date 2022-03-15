import 'package:flutter/material.dart';
import 'package:wheatherapp/services/changespart.dart';
import 'package:wheatherapp/services/get_api.dart';

class TopPart extends StatefulWidget {
  final dynamic decoded;
  final String country;
  const TopPart({Key? key, required this.decoded, required this.country}) : super(key: key);

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  String gradientType = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor, Theme.of(context).primaryColorLight]),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).secondaryHeaderColor,
            spreadRadius: 6,
            blurRadius: 10,
            offset: Offset(0, 9), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 170,
            height: 170,
            child: Image.asset(
              ImageGenerator().getImage(GetApi().getWeatherStatus(widget.decoded)),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 165,
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Theme.of(context).backgroundColor,
                      ),
                      Text(
                        widget.country,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 165,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    GetApi().getTemperature(widget.decoded).toStringAsFixed(1),
                    style: TextStyle(
                      // fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(GetApi().getWeatherStatus(widget.decoded)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
