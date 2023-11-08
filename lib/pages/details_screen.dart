import 'package:e_commerce/model/item.dart';
import 'package:e_commerce/shared/appbar.dart';
import 'package:e_commerce/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Details extends StatefulWidget {
  item product,price;
  Details({super.key, required this.product,required this.price});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
 bool isShowmore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details screen'),
        backgroundColor: appbarGreen,
        actions: [
          Consumer(builder: (context, classInstance, child) {
            return const ProductsAndPrice();
          },),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.product.Path),
            const SizedBox(
              height: 11,
            ),
            Text("\$ ${widget.product.price} ", style: const TextStyle(fontSize: 20.0)),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 129, 129),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "New",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 23,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 77,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.edit_location,
                      size: 26,
                      color: Color.fromARGB(168, 3, 65, 27),
                    )
                  ],
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  "Shopping",
                  style: TextStyle(fontSize: 19),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Details",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Our fashion adventure, which started in 2018, is moving forward with each passing day; continues to carry the most stylish pieces of the season and the warmth of fashion to its customers in many regions of our country. Our biggest goal is to reach more people together with our team, which is young, dynamic and makes it a principle to serve people better. From the east to the west of Turkey, we deliver the clothes that everyone can wear with the most affordable prices, in every point of this geography. Today, we are taking firm steps forward on this road, with the sale of tens of thousands of products every month, and we offer you services as you wish. All of our products are 100% domestic production, produced in our own workshop, with our own fabrics and domestic accessories. Our price policy is honest and transparent with the sense of commitment given by the whole production process. There are no intermediaries between us and the whole process is handled by Janes.",
              style: const TextStyle(fontSize: 18),
              maxLines: isShowmore? 3 : null,
              overflow: TextOverflow.fade,
            ),
            TextButton(onPressed: (){
              setState(() {
                isShowmore = !isShowmore;
              });
            }, child: Text(isShowmore? "show more" : "show less",style: const TextStyle(fontSize: 18),))
          ],
        ),
      ),
    );
  }
}
