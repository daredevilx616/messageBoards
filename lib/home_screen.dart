import 'package:flutter/material.dart';
import 'message_board_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> boards = [
    {
      'name': 'Games',
      'icon': Icons.games,
      'image': 'assets/games.jpg',
    },
    {
      'name': 'Business',
      'icon': Icons.group,
      'image': 'assets/business.jpg',
    },
    {
      'name': 'Public Health',
      'icon': Icons.health_and_safety,
      'image': 'assets/public.jpg',
    },
    {
      'name': 'Home',
      'icon': Icons.home,
      'image': 'assets/home.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Boards'),
      ),
      body: ListView.builder(
        itemCount: boards.length,
        itemBuilder: (context, index) {
          var board = boards[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MessageBoardScreen(boardName: board['name'])),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    board['image'],
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  ListTile(
                    title: Text(
                      board['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.of(context).pop(); // close the drawer
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.of(context).pop(); // close the drawer
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
