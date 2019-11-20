import 'package:flutter/material.dart';
import 'package:meals_app/widgets/favorites/favorites_screen.dart';
import 'package:meals_app/widgets/category/category_screen.dart';
import 'package:meals_app/widgets/core/widgets/drawer/delimeal_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'title': 'Categories', 'page': CategoryScreen()},
    {'title': 'Your favorites', 'page': FavoritesScreen()}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      drawer: DelimealDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          )
        ],
        onTap: _selectPage,
      ),
    );
  }
}
