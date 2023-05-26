import 'package:e_commerce_app/View_screens/Cart_screen.dart';
import 'package:e_commerce_app/View_screens/Favorite_screen.dart';
import 'package:e_commerce_app/View_screens/Home_screen.dart';
import 'package:e_commerce_app/View_screens/Menu_screen.dart';
import 'package:e_commerce_app/View_screens/Person_screen.dart';
import 'package:flutter/cupertino.dart';

class BottomProvider extends ChangeNotifier
{

  int i=0;
  int d=0;

  List screenList=[
    Home_screen(),
    Person_screen(),
    Cart_screen(),
    Favorite_screen(),
    Menu_screen(),
  ];

   void celectScreen(int value)
   {
     i=value;
     d=value;

     notifyListeners();
   }
}