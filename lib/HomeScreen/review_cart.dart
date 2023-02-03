import 'package:flutter/material.dart';
import 'package:food_app_3/HomeScreen/single_item.dart';

class Reviewcart extends StatelessWidget {
  const Reviewcart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Review cart',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: const Text('Total Amount'),
        subtitle: Text(
          '\$ 170.00',
          style: TextStyle(color: Colors.green.shade900),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            color: Colors.orange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 10,
        ),
        Singleitem(isbool: true),
        Singleitem(isbool: true),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
