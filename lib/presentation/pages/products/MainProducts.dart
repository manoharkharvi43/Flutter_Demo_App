import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/data/api/ProductsApi.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GetProducts>>(
      future: GetProductsApi(),
      builder:
          (BuildContext context, AsyncSnapshot<List<GetProducts>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  padding: EdgeInsets.symmetric(vertical: 30),
                  itemBuilder: (context, int index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  child: Image.network(
                                      "${snapshot?.data?[index].image}"),
                                  height: 100,
                                  width: 100,
                                ),
                                Text("Rs ${snapshot?.data?[index].price}")
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Text(
                                    "${snapshot?.data?[index]?.category}",
                                  ),
                                  width: 250,
                                ),
                                SizedBox(
                                  child: Text(
                                    "${snapshot?.data?[index]?.title}",
                                  ),
                                  width: 250,
                                )
                              ],
                            ),
                          ],
                        ),
                        visualDensity: VisualDensity.standard,
                        // subtitle: Text("${snapshot?.data?[index]?.category}"),
                      ),
                    );
                  });
            }
        }
      },
    );
  }
}

// ElevatedButton(
// onPressed: () => {getProductsApi()}, child: Text("Click Me"));
