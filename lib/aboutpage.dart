import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About Us',
          style: TextStyle(
            fontFamily: 'Lato',
          ),
        ),
        toolbarHeight: 75,
        backgroundColor: const Color.fromARGB(255, 255, 242, 0),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Name: United IT Solutions',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Computer,Laptop,Printer \n      Sales And Service',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Address: 115,New Jail Road\n(Opposite To Madura Coats),\nMadurai-625 016',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Contact Us:\nWhatsapp No:99433 12244 \nPhone No:80980 82244\nEmail:uniteditsolution28@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'CEO: A.Sathya \nService Engineer: V.S.Anand(8248825389)',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
