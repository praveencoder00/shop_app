import 'package:flutter/material.dart';

class DispCard extends StatelessWidget {
  final String title;
  final String imgloc;
  final String price;
  final int cardcolor;

  const DispCard({
    super.key,
    required this.title,
    required this.imgloc,
    required this.price,
    required this.cardcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardcolor.isEven
            ? const Color.fromARGB(156, 123, 194, 252)
            : const Color.fromRGBO(245, 247, 249, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '₹$price',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Align(
            child: Image.asset(
              imgloc,
              height: 175,
            ),
          )
        ],
      ),
    );
  }
}
