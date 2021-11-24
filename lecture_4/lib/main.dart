import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    Key? key,
    required this.photo,
    this.onTap,
    required this.width,
  }) : super(key: key);

  final String photo;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePageWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 means normal animation speed.

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
            ),
            label: 'School',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blueAccent,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      // floatingActionButton: FloatingActionButton.small(
      //     child: const Icon(Icons.accessible_forward),
      //     onPressed: () {
      //       print("pressed floating button");
      //     }),
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Column(
          children: const [
        Center(
          child: null,
        ),
      ]),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(),
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Text("Menu")),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(
      const MaterialApp(
        home: HomePageWidget(),
      ),
    );
