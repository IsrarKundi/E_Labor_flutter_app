import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // Keeps track of the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color :Color(0xffffa45b), ),
        child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffffa45b)
            ),
            height: height * 0.3,
            width: width,

            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Column(
                children: [
                  Center(
                    child:
                      Image.asset('images/logo.png', height: 40,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Location', style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16
                            ),
                            ),
                            Text('Saddar, Peshawar', style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                        // SizedBox(width: 130,),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 30.0, // Adjust the radius as needed
                              backgroundImage: AssetImage('images/israr2.jpeg',),
                              backgroundColor: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),

                  )
                ],
              ),
            ),

          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))
            ),
            height: height * 0.6172,
            width: width,
            child: Center(
              child: Text(
                'This is the content of the $_selectedIndex screen',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
        ),
      ),



      bottomNavigationBar: IconTheme(
        data: IconThemeData(
          color: Colors.grey, // Color for unselected icons
          size: 38.0, // Adjust size as needed
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey.withOpacity(0.9),

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 32,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, size: 32),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, size: 32),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 32),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xfff67322),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
