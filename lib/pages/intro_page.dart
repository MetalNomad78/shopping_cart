import 'package:flutter/material.dart';
import 'package:shopping_cart/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First half in one color
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                    color: const Color(0xFFeb5151),
                ), // Change this to your desired color
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0), // Set your desired radius
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset('lib/images/shop_cart.png'),
                    ),
                  ),
                ),
              ),

              // Second half in another color
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Get your Groceries",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Add more widgets as needed

                    // Button with the same color as the image
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: GestureDetector(
                        onTap: ()=>Navigator.push(
                          context, MaterialPageRoute(builder:(context){
                          return const HomePage();
                        },
                        ),
                        ),
                        child: Container(
                          decoration:BoxDecoration(
                              color: const Color(0xFFeb5151),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 20,
                              ),
                        
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
