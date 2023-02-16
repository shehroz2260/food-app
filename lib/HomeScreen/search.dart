import 'package:flutter/material.dart';
import 'package:food_app_3/HomeScreen/single_item.dart';
import 'package:food_app_3/helping_method.dart';

import '../models/product_model.dart';

class Search extends StatefulWidget {
  final List<Productmodel>? search;
  const Search({super.key, this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = '';

  searchItem(String query) {
    List<Productmodel> searchFood = widget.search!.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<Productmodel> _SearchItem = searchItem(query);
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Search',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: const [
            Icon(
              Icons.menu_rounded,
              color: Colors.black,
            )
          ],
        ),
        body: GestureDetector(
            onTap: () => hideKeyboard(context),
            child: ListView(children: [
              const ListTile(
                title: Text('Item'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 52,
                child: TextField(
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      query = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      fillColor: Colors.grey.shade400,
                      filled: true,
                      hintText: 'Search for items in the store',
                      suffixIcon: const Icon(Icons.search)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: _SearchItem.map((data) {
                  return Singleitem(
                    isbool: false,
                    productImage: data.productImage,
                    productName: data.productName,
                    productPrice: data.productPrice,
                  );
                }).toList(),
              ),
            ])));
  }
}
