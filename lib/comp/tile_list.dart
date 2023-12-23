import 'package:flutter/material.dart';
class ItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final Color color;

  final void Function()? onPressed;

  const ItemTile({
    super.key,
    required this.itemName,
  required this.itemPrice,
  required this.imagePath,
    required this.color,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
                imagePath,
              height: 64,
            ),
            Text(
                itemName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            MaterialButton(
                onPressed: onPressed,
              color: color.withOpacity(0.8),
              child: Text(
                  'Rs. ' + itemPrice +' per Kg',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),

              ),

            )

          ],
        ),

      ),
    );
  }
}
