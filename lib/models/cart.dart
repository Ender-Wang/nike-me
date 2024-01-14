import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
//list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Zoom FREAK',
        price: '199',
        imagePath: 'lib/images/black_white_blue.png',
        description:
            'The forward-thinking design of his latest signature shoe.'),
    Shoe(
        name: 'Air Jordans',
        price: '299',
        imagePath: 'lib/images/black_white.png',
        description: 'You\'ve got the hops and the speed-lace up in shoes.'),
    Shoe(
        name: 'KD Treys',
        price: '99',
        imagePath: 'lib/images/grey.png',
        description: 'A secure midfoot strap is suited for scoring binges.'),
    Shoe(
        name: 'Kyrie 6',
        price: '159',
        imagePath: 'lib/images/pink_white.png',
        description:
            'Bouncy cushioning is paired with soft yet supportive foam.'),
  ];

//list of items in the cart
  List<Shoe> userCart = [];

//get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

//get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

//add items to cart
  void addShoeToCart(Shoe shoe) {
    userCart.add(shoe);
    print("cart item count: " + userCart.length.toString());
    notifyListeners();
  }

//remove item from cart
  void removeItemFromShoe(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
