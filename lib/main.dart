import 'package:e_commerce_app/Bottom_navigation/Bottom_navigation.dart';
import 'package:e_commerce_app/Bottom_provider/Bottom_provider.dart';
import 'package:e_commerce_app/Provider_class/ProductProvider.dart';
import 'package:e_commerce_app/View_screens/Show_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomProvider(),),
          ChangeNotifierProvider(create: (context) => ProductProvider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/":(context) => Bottom_navigation(),
            "show":(context) => Show_data(),
          },
        ),
      ),
    ),
  );
}
