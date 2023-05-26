import 'package:e_commerce_app/Bottom_provider/Bottom_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bottom_navigation extends StatefulWidget {
  const Bottom_navigation({Key? key}) : super(key: key);

  @override
  State<Bottom_navigation> createState() => _Bottom_navigationState();
}

class _Bottom_navigationState extends State<Bottom_navigation> {

  BottomProvider? providerF;
  BottomProvider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<BottomProvider>(context,listen: false);
    providerT=Provider.of<BottomProvider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        body: providerT!.screenList[providerT!.i],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 5,
          currentIndex: providerT!.i,
          onTap: (value) {
            providerT!.celectScreen(value);
          },
          items: [
            BottomNavigationBarItem(icon: botton(Icons.home),label: ""),
            BottomNavigationBarItem(icon: botton(Icons.person),label: ""),
            BottomNavigationBarItem(icon: botton(Icons.shopping_bag),label: ""),
            BottomNavigationBarItem(icon: botton(Icons.favorite),label: ""),
            BottomNavigationBarItem(icon: botton(Icons.menu),label: ""),
          ],
        ),
      ),
    );
  }
  Widget botton(IconData i1)
  {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: providerT!.i==providerT!.d?Colors.blue:Colors.blue.shade50,
        boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 4,offset: Offset(0, 2))]
      ),
      alignment: Alignment.center,
      child: Icon(i1,size: 30,color: Colors.black,),
    );
  }
}
