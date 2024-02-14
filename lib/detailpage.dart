import 'dart:convert';
import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


import 'data.dart';

class datailspage extends StatefulWidget {
  const datailspage({super.key});

  @override
  State<datailspage> createState() => _datailspageState();
}

class _datailspageState extends State<datailspage> {
  double _rating = 3;
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    Products p= ModalRoute.of(context)!.settings.arguments as Products ;
    Future getdata()
    async {
      var url = Uri.https('dummyjson.com','products/${p.id}');
      var response = await http.get(url);
      Map m=jsonDecode(response.body);
      log("${m}");
      return m;
    }
    return Scaffold(
      appBar: AppBar(title: Text("Products"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              height: 300,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.fill,
                    image: NetworkImage("${p.thumbnail}"),)),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(height: 10,),

                Expanded(flex: 3,
                    child: Container(child: Text("${p.title}",style: TextStyle(fontSize: 20),))),

                SizedBox(height: 10,),
                Expanded(flex: 1,
                  child: Container(
                    //   alignment: Alignment.topRight,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      //image: DecorationImage(
                       // image: AssetImage("myasset/1.png"),
                    //  ),
                    ),
                    child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {
                      },icon: Icon(Icons.favorite,color: Colors.white,),
                    ),

                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(alignment:Alignment.topLeft,child: Text("id:${p.id}")),
            SizedBox(height: 10,),
            Container(alignment:Alignment.topLeft,child: Text("brand:${p.brand}")),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,borderRadius: BorderRadius.circular(50),),
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.favorite_border),

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,borderRadius: BorderRadius.circular(50),),
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.storage),

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,borderRadius: BorderRadius.circular(50),),
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.share),

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,borderRadius: BorderRadius.circular(50),),
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.add_chart),

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,borderRadius: BorderRadius.circular(50),),
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.print),

                  ),
                ),

              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text("${p.category}"
                      "\ncategory",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: Text("${p.stock}"
                      "\nstock",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: Text("Share"
                      "\nproduct",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: Text("Unit"
                      "\nChart",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: Text("print"
                      "\nproduct",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),

            Column(
              children: [


              ],
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.topLeft,
              child: Text("${p.description}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            )
          ],


        ),
      ),
    );
  }
}












