import 'package:flutter/material.dart';

import 'package:food_app_3/HomeScreen/product_overview.dart';
import 'package:food_app_3/HomeScreen/search.dart';
import 'package:food_app_3/providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'drawer_side.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Productprovider productprovider;
  @override
  void initState() {
    Productprovider productprovider = Provider.of(context, listen: false);
    productprovider.fetchHerbsProduct();
    productprovider.fetchfreshFruitData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productprovider = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.orange.shade300,
            radius: 15,
            child: IconButton(
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.search,
                size: 15,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Search(
                              search: productprovider.getsearchAllproduct,
                            )));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor: Colors.orange.shade300,
              radius: 15,
              child: IconButton(
                icon: const Icon(
                  Icons.shop,
                  size: 15,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
        backgroundColor: Colors.orange,
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      drawer: const Drawers(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/images.jpeg')),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 50,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(40),
                                          bottomLeft: Radius.circular(40))),
                                  child: Center(
                                    child: Text(
                                      'Vegi',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade200,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '30% off ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.green.shade100),
                                    ),
                                    Text(
                                      'on All vegetables Products ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green.shade100),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
              Doubletext(
                bigText: 'Herb seasonings',
                onpressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                          search: productprovider.getHerbsProductDataList)));
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: productprovider.getHerbsProductDataList
                        .map((herbsProductData) {
                  return ProductW(
                    productPrice: herbsProductData.productPrice,
                    name: herbsProductData.productName,
                    url: herbsProductData.productImage,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Productoverview(
                                    productPrice: herbsProductData.productPrice,
                                    productName: herbsProductData.productName,
                                    productImage: herbsProductData.productImage,
                                  )));
                    },
                  );
                }).toList()),
              ),
              Doubletext(
                bigText: 'Fresh Fruit',
                onpressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                          search: productprovider.getfreshFruitDataList)));
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: productprovider.getfreshFruitDataList
                        .map((fruitProductData) {
                  return ProductW(
                    productPrice: fruitProductData.productPrice,
                    name: fruitProductData.productName,
                    url: fruitProductData.productImage,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Productoverview(
                                    productPrice: fruitProductData.productPrice,
                                    productName: fruitProductData.productName,
                                    productImage: fruitProductData.productImage,
                                  )));
                    },
                  );
                }).toList()
                    // children: [
                    //   ProductW(
                    //     productPrice: 1,
                    //     url: 'assets/images/image5.jpg',
                    //     name: 'Berrie',
                    //     ontap: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => Productoverview(
                    //                     productPrice: 2,
                    //                     productName: 'Berries',
                    //                     productImage: 'assets/images/image5.jpg',
                    //                   )));
                    //     },
                    //   ),
                    // ],
                    ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class Doubletext extends StatelessWidget {
  final String bigText;
  final VoidCallback onpressed;
  const Doubletext({
    Key? key,
    required this.bigText,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Center(
          child: TextButton(
              onPressed: onpressed,
              child: const Text(
                'View all',
                style: TextStyle(color: Colors.grey),
              )),
        )
      ],
    );
  }
}

class ProductW extends StatelessWidget {
  const ProductW({
    Key? key,
    required this.url,
    required this.name,
    required this.ontap,
    required this.productPrice,
  }) : super(key: key);
  final String url;
  final String name;
  final VoidCallback ontap;
  final int productPrice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 230,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(url),
                ),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                '$productPrice\$/50 Gram',
                style: const TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Text(
                              '50 Gram',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.yellow,
                            ),
                          )
                        ],
                      ),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(child: Counter()),
                  ],
                ),
              )
            ]),
          ))
        ]),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({
    super.key,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                      }
                      if (count < 1) {
                        setState(() {
                          count--;
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.orange,
                      size: 15,
                    ),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.orange,
                      size: 15,
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ));
  }
}
