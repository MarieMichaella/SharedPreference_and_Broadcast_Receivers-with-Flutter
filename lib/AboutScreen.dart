import 'package:flutter/material.dart';
import 'package:navigations/CalculatorView.dart';
import 'package:navigations/main.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int _selectedIndex = 2; 

@override
Widget build(BuildContext context) {
  ThemeData theme = Theme.of(context);
  bool isDarkTheme = theme.brightness == Brightness.dark;

  return Scaffold(
    appBar: AppBar(
      title: Text('About Us'),
    ),
    backgroundColor:
        isDarkTheme ? Colors.black : Colors.white, 
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Our Pet Shop Adoption!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Our Mission:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'At Our Pet Shop Adoption, we are dedicated to finding loving homes for pets in need. Our mission is to provide a safe and caring environment for animals while matching them with compassionate and responsible adopters.',
            style: TextStyle(
              fontSize: 16,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Our Services:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '- Pet Adoption: We offer a variety of pets for adoption, including dogs, cats, rabbits, and more. Each animal in our care receives proper veterinary care and socialization to ensure they are ready for their forever home.',
            style: TextStyle(
              fontSize: 16,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '- Pet Supplies: In addition to adoption services, we also provide a range of pet supplies to help you care for your new furry friend. From food and toys to grooming products, we have everything you need to keep your pet happy and healthy.',
            style: TextStyle(
              fontSize: 16,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '- Community Outreach: We are committed to educating the community about responsible pet ownership and the importance of spaying and neutering. Through outreach programs and events, we strive to make a positive impact on animal welfare in our community.',
            style: TextStyle(
              fontSize: 16,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Contact Us:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Phone: (123) 456-7890\nEmail: info@ourpetshopadoption.com\nAddress: 1234 Pet Avenue, City, State, ZIP',
            style: TextStyle(
              fontSize: 16,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, -1), 
          ),
        ],
      ),
      child: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalculatorScreen()),
            );
          }
        },
      ),
    ),
  );
}

}
