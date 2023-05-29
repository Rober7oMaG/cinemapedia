import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  
  const CustomBottomNavigationBar({
    super.key, 
    required this.currentIndex
  });

  void onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      selectedItemColor: colors.primary,
      onTap: (index) => onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.thumbs_up_down_outlined),
          label: 'Popular'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorites'
        )
      ]
    );
  }
}