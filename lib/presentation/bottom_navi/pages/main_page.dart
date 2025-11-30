import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/bottom_navi_bloc.dart';
import '../bloc/bottom_navi_event.dart';
import '../bloc/bottom_navi_state.dart';

// 各 feature 页面
import '../../home/pages/home.dart';
import '../../profile/pages/profile.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final BottomNavBloc bloc = GetIt.I<BottomNavBloc>();

  final List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
            body: pages[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (index) {
                context.read<BottomNavBloc>().add(BottomNavChanged(index));
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
