import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          shrinkWrap:
              true, // Needed to allow inside scrollable parent (e.g. SingleChildScrollView)
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65, // Adjust based on your card's height/width
          children: List.generate(3, (index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
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
                      height: 150,
                      fit: BoxFit.cover,
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
                    subtitle: Text('Short description here...'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
