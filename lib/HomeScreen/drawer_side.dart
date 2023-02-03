import 'package:flutter/material.dart';
import 'package:food_app_3/HomeScreen/review_cart.dart';

import 'my_profile.dart';

class Drawers extends StatelessWidget {
  Widget listTile(
      {required IconData icon,
      required String title,
      required VoidCallback ontap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      onTap: ontap,
    );
  }

  const Drawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.orange.shade400,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 43,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Welcome Guest'),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 30,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          listTile(icon: Icons.home_outlined, title: 'Home', ontap: () {}),
          listTile(
              icon: Icons.shop_outlined,
              title: 'review Cart',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Reviewcart()));
              }),
          listTile(
              icon: Icons.person_outline,
              title: 'Profile',
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Myprofile()));
              }),
          listTile(
              icon: Icons.notifications_outlined,
              title: 'Notification',
              ontap: () {}),
          listTile(
              icon: Icons.star_outline,
              title: 'Rating and Review',
              ontap: () {}),
          listTile(
              icon: Icons.favorite_outline, title: 'Wishlist', ontap: () {}),
          listTile(
              icon: Icons.copy_outlined,
              title: 'Raise and Complaints',
              ontap: () {}),
          listTile(
              icon: Icons.format_quote_outlined, title: 'FAQs', ontap: () {}),
          SizedBox(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Supports',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text('Call Us:'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('+92307-0700000')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text('Mail Us:'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('foodapp@332gmail.com')
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
