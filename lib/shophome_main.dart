import 'package:flutter/material.dart';
import 'package:shop_app/displaycard.dart';
import 'package:shop_app/printerdata.dart';
import 'package:shop_app/printerdetail.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  final List<String> filters = const [
    'All',
    'Laser',
    'LaserJet',
    'DeskJet',
    'InkTank',
    'SmartTank',
    'OfficeJet',
  ];

  late String selectedFilter;
  List<Map<String, String>> filteredlist = printerinfo;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  void searchfilter(String val) {
    setState(() {
      filteredlist = printerinfo
          .where((element) =>
              element['title']!.toLowerCase().contains(val.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 12,
            width: double.infinity,
          ),
          Row(
            children: [
              const SizedBox(),
              const SafeArea(
                child: Text(
                  '  HP \n  Printers',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 25),
                  child: TextField(
                    onChanged: (value) => searchfilter(value),
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 1, bottom: 5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                          filteredlist = [];
                        });

                        for (var i = 0; i < printerinfo.length; i++) {
                          if (selectedFilter == printerinfo[i]['type']) {
                            filteredlist.add(printerinfo[i]);
                          }
                          if (selectedFilter == 'All') {
                            filteredlist.add(printerinfo[i]);
                          }
                        }
                      },
                      child: Chip(
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        backgroundColor: selectedFilter == filter
                            ? const Color.fromARGB(255, 255, 242, 0)
                            : const Color.fromRGBO(245, 247, 249, 1),

                        // body work Color.fromRGBO(216, 240, 253, 1)
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(25),
                        ),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          child: Text(
                            filter,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: filteredlist.isEmpty
                ? const Text('No Results found')
                : ListView.builder(
                    itemCount: filteredlist.length,
                    itemBuilder: (contex, index) {
                      final printinfo = filteredlist[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Printdetail(prodetail: printinfo);
                            }));
                          },
                          child: DispCard(
                            title: printinfo['title'] as String,
                            imgloc: printinfo['imgURL'] as String,
                            price: printinfo['price'] as String,
                            cardcolor: index,
                          ));
                    }),
          )
        ],
      ),
    );
  }
}
