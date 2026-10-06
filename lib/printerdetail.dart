import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class Printdetail extends StatefulWidget {
  final Map<String, String> prodetail;
  const Printdetail({super.key, required this.prodetail});

  @override
  State<Printdetail> createState() => _PrintdetailState();
}

class _PrintdetailState extends State<Printdetail> {
  void onTap() {
    Provider.of<CartProviderClass>(context, listen: false).addFavItem({
      'id': widget.prodetail['id'],
      'title': widget.prodetail['title'],
      'type': widget.prodetail['type'],
      'price': widget.prodetail['price'],
      'imgURL': widget.prodetail['imgURL'],
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Item Added')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 234, 233, 233),
        toolbarHeight: 75,
        centerTitle: true,
        title: Text(
          widget.prodetail['title'] as String,
          style: const TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            widget.prodetail['imgURL'] as String,
            height: 270,
          ),
          const Spacer(),
          Container(
            height: 170,
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 234, 233, 233)),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Text(
                    '₹${widget.prodetail['price']}',
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(
                              Size(double.infinity, 50)),
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 255, 242, 0))),
                      onPressed: onTap,
                      child: const Text(
                        'Add To Favorite',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
