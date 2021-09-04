import 'package:book_geeks/pages/cart/my_cart.dart';
import 'package:book_geeks/pages/fav_books/fav_book.dart';
import 'package:book_geeks/pages/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final List<DrawerItem> drawer = [
    DrawerItem('Favorite Books', Icons.book, FavBook()),
    DrawerItem('My Cart', Icons.shopping_cart, MyCart()),
    DrawerItem('User Profile', Icons.person, UserPage()),
  ];

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              Color(0xFF1b1e44),
              Color(0xFF00B8D4),
            ],
            stops: [
              0.05,
              0.7,
              // 1.0,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: Image.asset("./assets/images/logo.png"),
            ),
            Divider(
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => drawer[index].widget));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              drawer[index].icon,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          Text(drawer[index].name,
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.white))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: drawer.length,
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            Column(
              children: [
                Container(
                  child: InkWell(
                    onTap: () {
                      _launchURL('https://portfoliosk.netlify.app/');
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.web,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Visit My Portfolio",
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem {
  final String name;
  final IconData icon;
  final Widget widget;

  const DrawerItem(this.name, this.icon, this.widget);
}
