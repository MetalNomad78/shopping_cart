import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/comp/tile_list.dart';
import 'package:shopping_cart/model/cart_model.dart';
import 'package:shopping_cart/pages/cart.dart';

class Fruits extends StatelessWidget {
  const Fruits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopping Fruits",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Center-align the title
        backgroundColor: const Color(0xFFeb5151), // Set the app bar color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              // Navigate back to the home screen
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Select from the fruits",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "You can choose multiple items as well",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                thickness: 3,
                color: Color(0xFFeb5151),
              ),
            ),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopFruits.length,
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ItemTile(
                        itemName: value.shopFruits[index][0],
                        itemPrice: value.shopFruits[index][1],
                        imagePath: value.shopFruits[index][2],
                        color: value.shopFruits[index][3],
                          onPressed:(){
                            Provider.of<CartModel>(context,listen:false).addItemToCart(index);

                          }
                      );
                    },
                  );
                },
              ),
            ),
            // Add the rectangular button at the bottom


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder:(context){
            return const CartPage();
          },
          ),
          );// Add your onPressed functionality for the floating action button
        },
        backgroundColor: const Color(0xFFeb5151),
        child: Icon(
            Icons.shopping_bag,
          color: Colors.grey[300],
        )

      ),
    );
  }
}
