import 'package:flutter/material.dart';
import 'package:helios_test/model/user.dart';
import 'package:helios_test/repository/user_repository.dart';
import 'package:helios_test/view/user_view.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  int _page = 1;
  bool _isLoadMoreRunning = false;
  List<User> _users = [];
  late ScrollController _controller;
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _initUsers();
    _controller = ScrollController()
      ..addListener(() async {
        if (_controller.position.extentAfter < 300 && !_isLoadMoreRunning) {
          _isLoadMoreRunning = true;
          _page++;
          _users += await UserRepository().getUsers(page: _page);
          _isLoadMoreRunning = false;
          setState(() {});
        }
      });
  }

  Future<void> _initUsers() async {
    _users = await UserRepository().getUsers();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var displayedUsers = _users
        .where((user) =>
            user.firstname
                .toLowerCase()
                .contains(editingController.text.toLowerCase()) ||
            user.lastname
                .toLowerCase()
                .contains(editingController.text.toLowerCase()))
        .toList();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test pour Helios'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: editingController,
                decoration: const InputDecoration(
                  labelText: 'Recherche',
                  hintText: 'Recherche',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: displayedUsers.length,
                itemBuilder: (_, index) => Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: ListTile(
                    title: Text(displayedUsers[index].firstname),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.network(displayedUsers[index].photo),
                    ),
                    subtitle: Text(displayedUsers[index].lastname),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) =>
                              UserView(user: displayedUsers[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            if (_isLoadMoreRunning == true)
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}