import 'package:flutter/material.dart';
import 'package:navigations/CalculatorView.dart';
import 'Aboutscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData? theme;

  const MyApp({Key? key, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: IconButton(
              icon: Icon(Theme.of(context).brightness == Brightness.light ? Icons.brightness_6 : Icons.brightness_3),
              onPressed: () {
                Brightness newBrightness = Theme.of(context).brightness == Brightness.light ? Brightness.dark : Brightness.light;
                ThemeData newTheme = ThemeData(brightness: newBrightness);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => MyApp(theme: newTheme)),
                );
              },
            ),
          ),
        ],
      ),
drawer: Drawer(
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(70),
    ),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          height: 100,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.calculate),
          title: Text('Calculator'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalculatorScreen()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutScreen()),
            );
          },
        ),
      ],
    ),
  ),
),

      body: Stack(
        children: [
          Center(
            child: Positioned(
              bottom: 100,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/hi.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      child: Icon(Icons.home),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      child: Icon(Icons.calculate),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  label: 'Calculator',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      child: Icon(Icons.info),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  label: 'About',
                ),
              ],
              selectedItemColor: Colors.blue,
              onTap: (int index) {
                if (index == 0) {
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculatorScreen()),
                  );
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                }
              },
            ),
            body: Center(),
          ),
        ],
      ),
    );
  }
}
