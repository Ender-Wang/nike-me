import 'package:flutter/material.dart';
import 'package:nikeme/components/shoe_tile.dart';
import 'package:nikeme/models/shoe.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addShoeToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: ((context, value, child) => Column(
              children: [
                //search bar
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search',
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.grey.shade400,
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                //msg
                Center(
                  child: Text(
                    'what do you wanna wear today?',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ),

                const SizedBox(height: 10),

                //hot picks
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Hot Picks 🔥',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.blue.shade500,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Shoe shoe = value.getShoeList()[index];
                      return ShoeTile(
                        shoe: shoe,
                        onTap: () => addShoeToCart(shoe),
                      );
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                  child: SizedBox(
                    height: 25,
                  ),
                ),
              ],
            )));
  }
}
