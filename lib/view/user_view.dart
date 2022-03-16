import 'package:flutter/material.dart';
import 'package:helios_test/model/user.dart';

class UserView extends StatefulWidget {
  final User user;

  UserView({required this.user, Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.user.firstname} ${widget.user.lastname}'),
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(80.0),
            child: Image.network(widget.user.largePhoto),
          ),
          const SizedBox(height: 20),
          Text(
            '${widget.user.firstname} ${widget.user.lastname.toUpperCase()}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.account_circle),
              const SizedBox(width: 5),
              Text('Age : ${widget.user.age}'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.email),
              const SizedBox(width: 5),
              Text(widget.user.email),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.phone),
              const SizedBox(width: 5),
              Text(widget.user.phone),
            ],
          ),
        ]),
      ),
    );
  }
}
