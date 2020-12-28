import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Database/screen_provider.dart';
import 'package:provider_state_management/UI_Screen/tabbar_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ScreenProvider(),
      child: MaterialApp(
        title: 'Todo List SQLite',
        debugShowCheckedModeBanner: false,
        home: TabBarNav(),
      ),
    );
  }
}
