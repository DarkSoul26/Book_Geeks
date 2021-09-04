import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/info_card.dart';

const url = "https://portfoliosk.netlify.app/";
const email = "sanchitkalsi@gmail.com";
const phone = "9627948091";
const location = "Pune, India";

class UserPage extends StatelessWidget {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("Could not the $command");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('./assets/images/Sanchit.jpg'),
              ),
              Text(
                "Sanchit Kalsi",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),
              Text(
                "Designing - Web - App",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey[200],
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Source Sans Pro"),
              ),
              SizedBox(
                height: 30,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InfoCard(
                  text: phone,
                  icon: Icons.phone,
                  onPressed: () async {
                    customLaunch(
                        'tel:+91 9627948091');
                  }),
              InfoCard(
                  text: url,
                  icon: Icons.web,
                  onPressed: () async {
                    customLaunch('https://portfoliosk.netlify.app/');
                  }),
              InfoCard(
                  text: location,
                  icon: Icons.location_city,
                  onPressed: () async {}),
              InfoCard(text: email, icon: Icons.email, onPressed: () async {
                customLaunch(
                        'mailto:sanchitkalsi@gmail.com?subject=test%20subject&body=test%20body');
              }),
            ],
          ),
        ));
  }
}
