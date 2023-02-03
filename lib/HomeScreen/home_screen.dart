import 'package:flutter/material.dart';

import 'package:food_app_3/HomeScreen/product_overview.dart';
import 'package:food_app_3/HomeScreen/search.dart';

import 'drawer_side.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Search()));
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
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 180),
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
                          )),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
              const Doubletext(
                bigText: 'Herb seasonings',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductW(
                      name: 'Fresh Basil',
                      url: 'assets/images/image6.png',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Productoverview(
                                      productName: 'Fresh Basil',
                                      productImage: 'assets/images/image6.png',
                                    )));
                      },
                    ),
                    ProductW(
                      name: 'Fresh Mint',
                      url: 'assets/images/image7.webp',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Productoverview(
                                    productName: 'Fresh Mint',
                                    productImage:
                                        'assets/images/image7.webp')));
                      },
                    ),
                    ProductW(
                      name: 'Green Garlic',
                      url: 'assets/images/image8.jpg',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Productoverview(
                                      productName: 'Green Garlic',
                                      productImage: 'assets/images/image8.jpg',
                                    )));
                      },
                    ),
                    ProductW(
                      name: 'Bok Choy',
                      url: 'assets/images/image9.jpg',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Productoverview(
                                      productName: 'Bok Choy',
                                      productImage: 'assets/images/image9.jpg',
                                    )));
                      },
                    ),
                  ],
                ),
              ),
              const Doubletext(bigText: 'Fresh Fruit'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductW(
                      url: 'assets/images/image5.jpg',
                      name: 'Berrie',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Productoverview(
                                      productName: 'Berries',
                                      productImage: 'assets/images/image5.jpg',
                                    )));
                      },
                    ),
                    ProductW(
                      url: 'assets/images/image4.jpeg',
                      name: 'Water melon',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Productoverview(
                                      productName: 'Water Melon',
                                      productImage: 'assets/images/image4.jpeg',
                                    )));
                      },
                    ),
                    ProductW(
                      url: 'assets/images/image3.jpg',
                      name: 'Fresh Mango',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Productoverview(
                                      productName: 'Fresh Mango',
                                      productImage: 'assets/images/image3.jpg',
                                    )));
                      },
                    ),
                  ],
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
  const Doubletext({
    Key? key,
    required this.bigText,
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
        TextButton(
            onPressed: () {},
            child: const Text(
              'View all',
              style: TextStyle(color: Colors.grey),
            ))
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
  }) : super(key: key);
  final String url;
  final String name;
  final VoidCallback ontap;

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
              const Text(
                '50\$/50 Gram',
                style: TextStyle(color: Colors.grey),
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
                    Expanded(
                        child: Container(
                      // ignore: sort_child_properties_last
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.remove,
                            color: Colors.orange,
                            size: 15,
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.orange,
                            size: 15,
                          ),
                        ],
                      ),
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )),
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
