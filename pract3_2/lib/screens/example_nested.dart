import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final int index;

  const Screen(this.index, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
            index.toString()
        )
    );
  }

}

class NestedNavigatorState extends State<NestedNavigator> {
  int _currentIndex = 0;

  final _fstScreen = GlobalKey<NavigatorState>();
  final _scndScreen = GlobalKey<NavigatorState>();
  final _thrdScreen = GlobalKey<NavigatorState>();
  final _frthScreen = GlobalKey<NavigatorState>();


  void _onTap(int val, BuildContext context) {
    if (_currentIndex == val) {
      switch (val) {
        case 0:
          _fstScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        case 1:
          _scndScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        case 2:
          _scndScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        case 3:
          _scndScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _currentIndex = val;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.pop(context); },),),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            key: _fstScreen,
            onGenerateRoute: (route) => MaterialPageRoute<Screen>(
              settings: route,
              builder: (context) => Screen(_currentIndex),
            ),
          ),
          Navigator(
            key: _scndScreen,
            onGenerateRoute: (route) => MaterialPageRoute<Screen>(
              settings: route,
              builder: (context) => Screen(_currentIndex),
            ),
          ),
          Navigator(
            key: _thrdScreen,
            onGenerateRoute: (route) => MaterialPageRoute<Screen>(
              settings: route,
              builder: (context) => Screen(_currentIndex),
            ),
          ),
          Navigator(
            key: _frthScreen,
            onGenerateRoute: (route) => MaterialPageRoute<Screen>(
              settings: route,
              builder: (context) => Screen(_currentIndex),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (val) => _onTap(val, context),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Playlists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class NestedNavigator extends StatefulWidget {
  const NestedNavigator({Key? key}) : super(key: key);

  @override
  State<NestedNavigator> createState() => NestedNavigatorState();
}
