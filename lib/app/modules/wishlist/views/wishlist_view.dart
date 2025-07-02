import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WishlistView'), centerTitle: true),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/yotsugi.jpg',
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Magazine Name',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: const Text(
                      '\$50',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      'ahiahfuihawuifuwaguiawguiawhguhawuifhwaifa',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: Size(
                          MediaQuery.of(context).size.width,
                          56,
                        ),
                      ),
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
