import 'package:flutter/material.dart';
import 'package:helios_test/model/user.dart';
import 'package:helios_test/repository/user_repository.dart';
import 'package:helios_test/view/user_list_view.dart';
import 'package:helios_test/view/user_view.dart';

void main() {
  runApp(const HeliosApp());
}

class HeliosApp extends StatelessWidget {
  const HeliosApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helios Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserListView(),
    );
  }
}
