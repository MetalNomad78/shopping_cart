import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _shopItems=[
    ["Pumpkin","42","lib/images/pumpkin.png",Colors.orange],
    ["Tomato","22","lib/images/tomato.png",Colors.red],
    ["Okra","14","lib/images/okra.png",Colors.green],

    ["Onion","46","lib/images/onion.png",Colors.pink],
  ];
  final List _shopFruits=[
    ["Apple","23","lib/images/apple.png",Colors.red],
    ["Banana","31","lib/images/banana.png",Colors.yellow],
    ["Orange","80","lib/images/orange.png",Colors.orange],
    ["Watermelon","120","lib/images/watermelon.png",Colors.green],
  ];
  final List _cartItems=[];
  get shopItems=>_shopItems;
  get shopFruits=>_shopFruits;
  get cartItems=>_cartItems;
  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    _cartItems.add(_shopFruits[index]);
    notifyListeners();
  }
  // void addItemToCar(int index){
  //   _cartItems.add(_shopFruits[index]);
  //   notifyListeners();
  // }
  void removeItemFromCart(int index){
    _cartItems.remove(_shopItems[index]);
    _cartItems.remove(_shopFruits[index]);
    notifyListeners();
  }
  // void removeItemFromCar(int index){
  //   _cartItems.remove(_shopFruits[index]);
  //   notifyListeners();
  // }
  String calculateTotal(){
    int totalPrice=0;
    for(int i=0;i<_cartItems.length;i++){
      totalPrice+=int.parse(_cartItems[i][1]);
    }
    return totalPrice.toString();
  }
}