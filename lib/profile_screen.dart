import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset('images/logo.png', height: 33,),
        ),
      ),
      body:
      Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(

            children: [
              Text('My Profile',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              SizedBox(height: 16,),
              SizedBox(
                height: 100,
                width: 100,
                child: FittedBox(
                  child: CircleAvatar(
                    radius: 30.0, // Adjust the radius as needed
                    backgroundImage: AssetImage('images/israr2.jpeg',),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Text(
                  'Israr Kundi',
                   style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              SizedBox(height: 0,),
              Text(
                  'israrikhere@gmail.com',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600]
                  ),
              ),
              SizedBox(height: 12,),
              OutlinedButton(
                onPressed: () {
                  // Handle button press action here
                },
                child: Text('Edit Profile', style: TextStyle(color: Color(0xfff67322))),
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: Color(0xfff67322), width: 2.0)),
                  backgroundColor: MaterialStateProperty.all(Color(0xfffef1e9)),
                  padding: MaterialStateProperty.all(EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26,),
              ProfileScreenButton(buttonIcon: Icons.settings, buttonLabel: 'Setting'),
              SizedBox(height: 26,),
              ProfileScreenButton(buttonIcon: Icons.help, buttonLabel: 'Help'),
              SizedBox(height: 26,),
              ProfileScreenButton(buttonIcon: Icons.logout, buttonLabel: 'Logout')
            ],
          ),
        ),
      ),

    );
  }
}

class ProfileScreenButton extends StatelessWidget {
  ProfileScreenButton({super.key, required this.buttonIcon, required this.buttonLabel});

  final IconData buttonIcon;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Color(0xfffef1e9),
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Color(0xfff67322),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                buttonIcon,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 32,),
            Expanded(
              child: Text(
                buttonLabel,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
