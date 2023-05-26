import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //top
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello Darshan!",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade50,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            //sale
            SizedBox(height: 2.h),
            Container(
              height: 15.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage("assets/image/t1.png"),fit: BoxFit.cover),              ),
            ),
            //coming soon
            SizedBox(height: 3.h),
            Container(
              height: 35.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage("assets/image/t2.png"),fit: BoxFit.cover),
              ),
            ),
            //popular
            SizedBox(height: 2.h),
            Text(
              "Popular Category",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                InkWell(onTap:() {
                  Navigator.pushNamed(context, "show");
                },child: category("Men","Trading","assets/image/t3.png")),
                category("Women","Friendly","assets/image/t4.png"),
                category("Men","Running","assets/image/t5.png"),
                category("Children","Sport","assets/image/t6.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget category(String gender,String cetgo,String img)
  {
    return Container(
      height: 14.h,
      width: 22.w,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 9.h,
            width: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage("$img"),fit: BoxFit.cover),
            ),
          ),
          Text("$gender",style: TextStyle(fontSize: 17,color: Colors.black87),),
          Text("$cetgo",style: TextStyle(fontSize: 18,color: Colors.black),)
        ],
      ),
    );
  }
}
