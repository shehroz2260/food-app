import 'package:flutter/material.dart';

enum SigninCharacter { fill, outline }

class Productoverview extends StatefulWidget {
  final String productName;
  final String productImage;
  const Productoverview({
    super.key,
    required this.productName,
    required this.productImage,
  });

  @override
  State<Productoverview> createState() => _ProductoverviewState();
}

class _ProductoverviewState extends State<Productoverview> {
  SigninCharacter _character = SigninCharacter.fill;

  Widget bottonnaviagationbar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required IconData iconData,
    required String title,
  }) {
    return Expanded(
        child: Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 15,
            color: iconColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(color: color),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Product OverView',
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          bottonnaviagationbar(
              iconColor: Colors.grey,
              backgroundColor: Colors.black,
              color: Colors.white,
              iconData: Icons.favorite_outline,
              title: 'Add to WishList'),
          bottonnaviagationbar(
              iconColor: Colors.white,
              backgroundColor: Colors.orange,
              color: Colors.black,
              iconData: Icons.shop_outlined,
              title: 'Go to Cart'),
        ],
      ),
      body: Column(children: [
        Expanded(
            flex: 3,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.productName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('50\$'),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.all(40),
                    child: Image(image: AssetImage(widget.productImage)),
                  ),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'Available Option',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green.shade700,
                            ),
                            Radio(
                              activeColor: Colors.green.shade700,
                              groupValue: _character,
                              value: SigninCharacter.fill,
                              onChanged: (value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        const Text('\$50'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add,
                                size: 17,
                                color: Colors.orange,
                              ),
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.orange),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'About This Product',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'A product can be a service or an item. It can be physical or in virtual or cyber form. Every product is made at a cost and each is sold at a price.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ]),
        ))
      ]),
    );
  }
}
