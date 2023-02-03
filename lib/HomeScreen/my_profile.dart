import 'package:flutter/material.dart';

import 'drawer_side.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({super.key});

  @override
  Widget build(BuildContext context) {
    Widget listTile({
      required IconData icon,
      required String title,
    }) {
      return Column(
        children: [
          const Divider(
            height: 1,
          ),
          ListTile(
            title: Text(title),
            trailing: const Icon(Icons.arrow_forward_ios),
            leading: Icon(icon),
          )
        ],
      );
    }

    return Scaffold(
      drawer: const Drawers(),
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'My Profile',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.orange,
              ),
              Container(
                height: 503,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 80,
                          width: 250,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Shehroz',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('shehroz@gmail.com')
                                  ],
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  radius: 15,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    radius: 12,
                                    child: const Icon(
                                      Icons.edit,
                                      size: 19,
                                      color: Colors.orange,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                    listTile(icon: Icons.shop_outlined, title: 'My Order'),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: 'My delivery Address'),
                    listTile(
                        icon: Icons.person_outline, title: 'Refer a Person'),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: 'Terms and condition'),
                    listTile(
                        icon: Icons.policy_outlined, title: 'Privacy Policy'),
                    listTile(icon: Icons.add_chart_outlined, title: 'About'),
                    listTile(
                        icon: Icons.exit_to_app_outlined, title: 'Log Out'),
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.black87,
                child: Image(image: AssetImage('assets/images/vegi.webp')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
