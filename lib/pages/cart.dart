import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My Cart",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.shopping_bag,
              color: Colors.white,),
          ],
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
      body: Consumer<CartModel>(
          builder:(context,value,child){
    return Column(
    children: [
    Expanded(
    child: ListView.builder(
      itemCount: value.cartItems.length,
    padding: const EdgeInsets.all(12),
    
    itemBuilder: (context,index){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: Image.asset(value.cartItems[index][2],
          height:36,),
        title: Text(value.cartItems[index][0]),
          subtitle: Text('Rs. ' + value.cartItems[index][1]),
          trailing: IconButton(
              icon:const Icon(Icons.cancel),
      onPressed:()=> Provider.of<CartModel>(context,listen:false).removeItemFromCart(index,value.cartItems[index][4]))
        ),
      ),
    );
    },
    ),
    ),
      Padding(
        padding: const EdgeInsets.all(36.0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFeb5151),
          borderRadius:BorderRadius.circular(12),
          ),

          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "Total Price",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  Text('Rs. ' + value.calculateTotal(),
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
            ],
          ),
        ),
      )
    ],
    );
    },
      ),
    );
  }
}
