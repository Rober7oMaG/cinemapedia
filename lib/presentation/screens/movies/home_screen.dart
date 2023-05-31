import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/views/views.dart';


class HomeScreen extends StatefulWidget {
  static const name = 'home_screen';
  final int pageIndex;
  
  const HomeScreen({
    super.key, 
    required this.pageIndex
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  final viewRoutes = const <Widget>[
    HomeView(),
    PopularView(),
    FavoritesView()
  ];

  @override
  void initState() {
    super.initState();
    
    pageController = PageController(
      keepPage: true
    );
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex, 
        curve: Curves.easeInOut, 
        duration: const Duration(milliseconds: 250),
      );
    }

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        // index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigationBar( 
        currentIndex: widget.pageIndex,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}