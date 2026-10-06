import 'package:flutter/material.dart';
import 'package:shop_app/aboutpage.dart';
import 'package:shop_app/favoritespage.dart';
import 'package:shop_app/shophome_main.dart';

class ShopappHome extends StatefulWidget {
  const ShopappHome({super.key});

  @override
  State<ShopappHome> createState() => _ShopappHomeState();
}

int currentpage = 0;
const List<Widget> productsOfPage = [
  ProductHome(),
  FavoriteItemsPage(),
  About()
];

class _ShopappHomeState extends State<ShopappHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentpage = value;
          });
        },
        currentIndex: currentpage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded),
            label: 'About',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentpage,
        children: productsOfPage,
      ),
    );
  }
}
