import 'package:flutter/material.dart';
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/view/main_screens/main_menu.dart';
import 'package:kegel_training/view/profile_screen.dart';

import '../../controller/user_controller.dart';
import '../../generated/l10n.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pageIndex = 0;
  final PageController _pageController = PageController(initialPage:0);

  final List<Widget> _screens =
  [
    const MainMenu(),
    ProfileScreen(),
  ];
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_pageIndex != 0) {
            _setPage(0);
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor:Colors.white70,
            showUnselectedLabels: true,
            currentIndex: _pageIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              _barItem(Icons.check_box_rounded,S.of(context).plan, 0),
              _barItem(Icons.person,S.of(context).profile, 1),

            ],
            onTap: (int index) {
              _setPage(index);
            },
          ),

          body: PageView.builder(
            controller: _pageController,
            itemCount: _screens.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _screens[index];
            },
          ),

        ));
  }
  BottomNavigationBarItem _barItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none, children: [
        Icon(icon),
      ],
      ),
      label: label,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}

