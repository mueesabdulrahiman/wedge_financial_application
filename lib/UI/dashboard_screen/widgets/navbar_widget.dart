import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget navbar(BuildContext context) => BottomNavigationBar(
          backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
         
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          currentIndex: 0,
         // onTap: (value) => notifier.value = value,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items:  [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child:SvgPicture.asset('assets/navIcons/Dashboard-navIcon.svg'),
                ),
                label: 'Home'),
          
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child:SvgPicture.asset('assets/navIcons/Assets&Liabilities-navicon.svg')
                ),
                label: 'Assets & Liabilities'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: SvgPicture.asset('assets/navIcons/WealthFlow-navicon.svg'),
                ),
                label: 'WealthFlow'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: SvgPicture.asset('assets/navIcons/hoxton-navicon.svg'),
                ),
                label: 'My Hoxton'),
          ],

        );
