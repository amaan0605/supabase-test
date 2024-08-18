import 'package:flutter/material.dart';
import 'package:supabase_test/services/database/database.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key, required this.categoryName});

  final String categoryName;

  DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: dataService.fetchData(categoryName),
            builder: (context, snapshot) {
              //DATA LOADING
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );

                // ERROR
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("SOME ERROR OCCURED!"),
                );

                // DATA RECIEVED
              } else if (snapshot.hasData) {
                final dataList = snapshot.data;
                return ListView.builder(
                    itemCount: dataList!.length,
                    itemBuilder: (context, index) {
                      final data = dataList[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            title: Row(
                              children: [
                                const Text(
                                  'SAMSUNG',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(' GALAXY ${categoryName.toUpperCase()}')
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data['updated_at'].toString()),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹${data['purchase_price'].toString()}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'IN STOCK',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });

                //ELSE
              } else {
                return const Center(
                  child: Text('Error 404'),
                );
              }
            }));
  }
}
