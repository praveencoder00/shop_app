import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class FavoriteItemsPage extends StatefulWidget {
  const FavoriteItemsPage({super.key});

  @override
  State<FavoriteItemsPage> createState() => _FavoriteItemsPageState();
}

class _FavoriteItemsPageState extends State<FavoriteItemsPage> {
  @override
  Widget build(BuildContext context) {
    final finfavlist = Provider.of<CartProviderClass>(context).favitem;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 242, 0),
        centerTitle: true,
        toolbarHeight: 75,
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
          itemCount: finfavlist.length,
          itemBuilder: (context, index) {
            final favind = finfavlist[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage(finfavlist[index]['imgURL'] as String),
                ),
                title: Text(
                  finfavlist[index]['title'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '₹${finfavlist[index]['price'] as String}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Remove from Favorite'),
                        content:
                            const Text('Are sure to remove form favorites'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProviderClass>(context,
                                      listen: false)
                                  .removeFavItem(favind);
                              Navigator.pop(context, 'OK');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Item Removed')));
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 243, 33, 33)),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete,
                      color: Color.fromARGB(255, 211, 0, 0)),
                ),
              ),
            );
          }),
    );
  }
}
