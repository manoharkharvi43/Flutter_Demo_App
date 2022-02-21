import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/data/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Center(
            child: Container(
              child: Text(
                "Container 1",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              height: 100,
              color: Colors.amber,
              width: MediaQuery.of(context).size.width * 0.9,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20),
            ),
          ),
          onTap: () => {
            // Provider.of<ThemeProvider>(context, listen: false)
            //     .changeThemeColor(color1: Colors.green)
          },
        ),
        GestureDetector(
          child: Center(
            child: Container(
              child: Text("Container 2",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
              height: 100,
              color: Colors.teal,
              width: MediaQuery.of(context).size.width * 0.9,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20),
            ),
          ),
          onTap: () => {
            // Provider.of<ThemeProvider>(context, listen: false)
            //     .changeThemeColor(color2: Colors.yellow)
          },
        ),
        GestureDetector(
          child: Center(
            child: Container(
              child: Text("Container 2",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
              height: 100,
              color: Colors.blue,
              width: MediaQuery.of(context).size.width * 0.9,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20),
            ),
          ),
          onTap: () => {},
        ),
        ElevatedButton(
            onPressed: () => {
                  context.read<toggleBackgroundColor>().changeBgColor(
                      context.read<toggleBackgroundColor>().isDark
                          ? Colors.black
                          : Colors.white)
                },
            child: Text(
                "${context.read<toggleBackgroundColor>().isDark ? "Dark Mode" : "Light Mode"}"))
      ],
    );
  }
}

// ChangeNotifierProvider<ThemeProvider>(
// create: (context) => ThemeProvider(),
// child: Consumer<ThemeProvider>(
// builder: (context, themeProvider, child) => Column(
// children: [
// Center(
// child: Container(
// child: SizedBox(
// child: Text(
// "hello",
// style: TextStyle(
// decoration: TextDecoration.none,
// color: Colors.white,
// fontSize: 20),
// ),
// ),
// ),
// ),
// ElevatedButton(onPressed: () => {}, child: Text("Change Theme"))
// ],
// ),
// )
// );
