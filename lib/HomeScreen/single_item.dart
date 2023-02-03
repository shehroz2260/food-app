import 'package:flutter/material.dart';

class Singleitem extends StatelessWidget {
  bool isbool = false;
  Singleitem({super.key, required this.isbool});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 100,
                child: const Center(
                    child: Image(
                  image: AssetImage('assets/images/image6.png'),
                )),
              )),
              Expanded(
                  child: Container(
                height: 100,
                child: Column(
                    mainAxisAlignment: isbool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ProductName',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '50\$/50 Gram',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      isbool == false
                          ? Container(
                              margin: const EdgeInsets.only(right: 15),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(children: const [
                                Expanded(
                                  child: Text(
                                    '50 Gram',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: Colors.orange,
                                )
                              ]),
                            )
                          : const Text("50 Gram"),
                    ]),
              )),
              Expanded(
                  child: Container(
                      padding: isbool == false
                          ? const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 32)
                          : const EdgeInsets.only(right: 15, left: 15),
                      height: 100,
                      child: isbool == false
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: Colors.grey),
                              ),
                              height: 25,
                              width: 50,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      'ADD',
                                      style: TextStyle(color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: Colors.black54,
                                  size: 30,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  height: 25,
                                  width: 70,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          'ADD',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ))),
            ],
          ),
        ),
        isbool == false
            ? Container()
            : const Divider(
                height: 1,
                color: Colors.black,
              )
      ],
    );
  }
}
