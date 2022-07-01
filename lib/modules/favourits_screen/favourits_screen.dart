import 'package:flutter/material.dart';

class FavouritsScreen extends StatefulWidget {
  const FavouritsScreen({Key? key}) : super(key: key);

  @override
  State<FavouritsScreen> createState() => _FavouritsScreenState();
}

class _FavouritsScreenState extends State<FavouritsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              body: Container(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("press"),
                    ),
                  )));
  }
}
