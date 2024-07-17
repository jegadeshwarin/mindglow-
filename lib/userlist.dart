import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mindglow/model.dart';
import 'package:mindglow/userdetails.dart';

class UserList extends StatefulWidget {
  final String title;
  const UserList({super.key, required this.title});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Future? userlist;
  @override
  void initState() {
    super.initState();
    userlist = fetchUser();
  }

  fetchUser() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      var jsonresponse = json.decode(response.body);
      return jsonresponse.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load user list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black))),
        body: Center(
            child: FutureBuilder(
                future: userlist,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No users found'));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          User user = snapshot.data![index];
                          return Card(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                  contentPadding: const EdgeInsets.all(16.0),
                                  leading: CircleAvatar(
                                      backgroundColor: Colors.blueAccent,
                                      child: Text(user.name![0],
                                          style: const TextStyle(
                                              color: Colors.white))),
                                  title: Text(user.name!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(user.email!),
                                        const SizedBox(height: 4),
                                        Text(user.phone!)
                                      ]),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserDetails(user: user)));
                                  }));
                        });
                  }
                })));
  }
}
