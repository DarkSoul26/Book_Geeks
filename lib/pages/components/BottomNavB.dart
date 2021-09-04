import 'package:book_geeks/pages/fav_books/fav_book.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data.dart';

class BtNavB extends StatefulWidget {
  @override
  _BtNavBState createState() => _BtNavBState();
}

class _BtNavBState extends State<BtNavB> {
  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 8,
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buildNavigationItems(),
      ),
    );
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return FlatButton(
      onPressed: () {
        setState(() {
          selectedItem = item;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavBook()),
        );
      },
      child: Container(
        width: 50,
        child: Center(
          child: Icon(
            item.iconData,
            color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
            size: 28,
          ),
        ),
      ),
    );
  }
}
