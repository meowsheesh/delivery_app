import 'package:flutter/material.dart';

class MyTileWidget extends StatefulWidget {
  MyTileWidget({Key? key, required this.address, required this.color, required this.workingTime}) : super(key: key);
  final String address;
  Color color;
  final DateTime workingTime;

  @override
  State<MyTileWidget> createState() => _MyTileWidgetState();
}

class _MyTileWidgetState extends State<MyTileWidget> {
  Color backgroundColor = const Color(0xffFCFCFC);
  bool onPressed = false;
  List<BoxShadow> boxShadow = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onPressed){
          backgroundColor = const Color(0xffFCFCFC);
          boxShadow = [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 15,
              offset: Offset(0, 3),
            ),
          ];
          onPressed = false;
          widget.color = const Color(0xffE53919);
          setState(() {
          });
        }else{
          backgroundColor = Colors.transparent;
          widget.color = Colors.black;
          onPressed = true;
          boxShadow = [];
          setState(() {
          });
        }

      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 17,
          top: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: boxShadow,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.only(
                top: 19,
                bottom: 23,
                left: 20,
                right: 27
            ),
            title: Text(widget.address, style: TextStyle(color: widget.color, fontWeight: FontWeight.bold),),
            subtitle: Text('Доставка: ${widget.workingTime}'),
            trailing: const Icon(Icons.edit, color: Colors.black,),
          ),
        ),
      ),
    );
  }
}
