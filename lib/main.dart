import 'package:flutter/material.dart';
import 'package:quotica/quoteScreen.dart';
import 'package:quotica/widget/theme.dart';

void main(){
  runApp(Quotica());
}

class Quotica extends StatelessWidget {
  const Quotica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mytheme,
      home: Quotescreen(),
    );
  }
}