import 'package:e_commerce_app/Model_class/Product_model.dart';
import 'package:e_commerce_app/Provider_class/ProductProvider.dart';
import 'package:e_commerce_app/utils/api_Helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Show_data extends StatefulWidget {
  const Show_data({Key? key}) : super(key: key);

  @override
  State<Show_data> createState() => _Show_dataState();
}

class _Show_dataState extends State<Show_data> {
  ProductProvider? providerF;
  ProductProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<ProductProvider>(context, listen: false);
    providerT = Provider.of<ProductProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Street Style",
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
              FutureBuilder(
                future: providerT!.apiDataParsing(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List<ProductModel> data = snapshot.data!;
                    return Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 47.h,
                        ),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                height: 45.h,
                                width: 47.w,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //img
                                    Container(
                                      height: 25.h,
                                      width: 45.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${data[index].image}"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "${data[index].category}",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${data[index].title}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "\$  ${data[index].price}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 5.h,
                                width: 10.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                alignment: Alignment.center,
                                child: index%2==0?Icon(Icons.favorite_border):Icon(Icons.favorite,color: Colors.red,),
                              )
                            ],
                          );
                        },
                        itemCount: data.length,
                      ),
                    );
                  } else
                    return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Expanded(
// child: GridView.builder(
// scrollDirection: Axis.vertical,
// physics: BouncingScrollPhysics(),
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisExtent: 40.h,
// ),
// itemBuilder: (context, index) {
// return Container(
// height: 40.h,
// width: 45.w,
// margin: EdgeInsets.all(10),
// child: Column(
// children: [
// //img
// Container(
// height: 25.h,
// width: 45.w,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// image: DecorationImage(image: AssetImage("${l1[index].image}")),
// boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5)]
// ),
// ),
// Text("${l1[index].category}",style: TextStyle(fontSize: 18,color: Colors.black),)
// ],
// ),
// );
// },
// itemCount: l1.length,
// ),
// ),
