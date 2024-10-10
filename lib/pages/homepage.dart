import 'package:flutter/material.dart';
import 'package:gifthope/pages/donate_money.dart';
import 'package:gifthope/pages/donate_things.dart';
import 'package:gifthope/pages/items_needed.dart';
import 'package:gifthope/main.dart';
import 'package:gifthope/pages/form.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift of Hope'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset('assets/images/logo.jpg'), // Replace with your logo asset
            ),
            ListTile(
              title: const Text('Gift Money'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DonateMoneyPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Gift Things'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DonateThingsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Gifts Needed'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ItemsNeededPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            ListTile(
              title: const Text('Version: 1.0.0'), // Replace with your app version
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 27, // Adjust the font size here
                  fontFamily: 'italic',
                  color: Colors.blue,
                ),
              ),
              const Text(
                'Gift money or items to help those in need.',
                style: TextStyle(
                  fontSize: 18, // Adjust the font size here
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DancingScript', 
                  color: Colors.blue,// Adjust the font family here
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Gift Money'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DonateMoneyPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Gift Things'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DonateThingsPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Gift Items Needed'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ItemsNeededPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Demo_form'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const demo()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}