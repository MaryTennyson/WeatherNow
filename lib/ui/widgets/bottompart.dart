import 'package:flutter/material.dart';
import 'package:wheatherapp/services/get_api.dart';

class BottomPart extends StatefulWidget {
  final dynamic decoded;
  final String country;
  const BottomPart({Key? key, required this.decoded, required this.country}) : super(key: key);

  @override
  State<BottomPart> createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).secondaryHeaderColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).secondaryHeaderColor,
            spreadRadius: 6,
            blurRadius: 10,
            offset: Offset(0, 9), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ColumnMaker("Wind", GetApi().getWindSpeed(widget.decoded).toString()),
          ColumnMaker("Humidity", GetApi().getHumidity(widget.decoded).toString()),
          ColumnMaker("Pressure", GetApi().getPressure(widget.decoded).toString()),
          ColumnMaker("Feels Like", GetApi().getFeelsLike(widget.decoded).toString()),
          Container(
            alignment: Alignment.topLeft,
            height: 1,
            width: 283,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class ColumnMaker extends StatefulWidget {
  const ColumnMaker(this.statu, this.value, {Key? key}) : super(key: key);
  final String statu;
  final String value;

  @override
  State<ColumnMaker> createState() => _ColumnMakerState();
}

class _ColumnMakerState extends State<ColumnMaker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 1,
          width: 283,
          color: Colors.white,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 45,
          width: 283,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.statu,
                style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
              Text(
                widget.value,
                style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
