import 'package:book_geeks/customIcons.dart';
import 'package:book_geeks/pages/drawer/drawer.dart';
import 'package:book_geeks/pages/home/bookstore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  double xOffeset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double val = 0;
  bool isDrawerOpen = false;
  bool isLoading = true;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      backgroundColor: Color(0xFFC6A9E6),
      body: SafeArea(
        child: Stack(
          children: [
            NavDrawer(),
            AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isDrawerOpen ? 15 : 0),
                color: Colors.white,
              ),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(xOffeset, yOffset, 0)
                ..scale(scaleFactor),
              duration: Duration(milliseconds: 300),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: isDrawerOpen
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    xOffeset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                    val = 0;
                                  });
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_left_outlined,
                                  size: 35,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    xOffeset = rightSlide;
                                    yOffset = 110;
                                    scaleFactor = 0.7;
                                    isDrawerOpen = true;
                                    val = 1;
                                  });
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.black,
                                ),
                              ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: IconButton(
                          onPressed: () {
                          },
                          icon: isSearching
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Icon(
                                  CustomIcons.option,
                                  color: Colors.grey,
                                ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                          height:
                              MediaQuery.of(context).size.height * 0.5,
                            child:  Bookstore(),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
