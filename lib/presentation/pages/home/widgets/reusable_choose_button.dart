import 'package:flutter/material.dart';

Widget chooseButton(){
  return Padding(
    padding: const EdgeInsets.only(left: 14.0, right: 16, top: 20),
    child: Container(
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: Color(0xff1E1F1E),
      ),
      child: const Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 17.5),
          child: Text('Выбрать',style: TextStyle(color: Colors.white),),
        ),
      ),
    ),
  );

}