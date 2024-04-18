import "package:flutter/material.dart";
import "package:mealsapp/screens/categories.dart";
import "package:mealsapp/screens/meals.dart";

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen();
    var activePageTitle = "Categories";
    if (selectedIndex == 1) {
      activePage = MealsScreen(meals: []);
      activePageTitle = "Favorites";
    }
    ;
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "fav",
          ),
        ],
      ),
    );
  }
}
