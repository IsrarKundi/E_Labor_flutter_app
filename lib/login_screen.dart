import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Define a focus node for each text field
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  // Define a variable to track whether any text field is focused
  bool isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();

    // Add listeners to each focus node to update the focus state
    emailFocusNode.addListener(updateTextFieldFocus);
    passwordFocusNode.addListener(updateTextFieldFocus);
  }

  @override
  void dispose() {
    // Dispose focus nodes
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  // Function to update the focus state when any text field is focused
  void updateTextFieldFocus() {
    setState(() {
      isTextFieldFocused = emailFocusNode.hasFocus ||
          passwordFocusNode.hasFocus;
    });
  }

  Future<void> signIn() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text;

    // Make the API request
    final response = await http.post(
      Uri.parse('https://blogs-api-ebon.vercel.app/api/v1/auth/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      // Authentication successful, navigate to next screen
      // Extract token from response body
      final String token = response.body;

      // Navigate to next screen and pass token as argument
      Navigator.pushReplacementNamed(context, '/home', arguments: token);
    } else {
      // Authentication failed, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Authentication failed'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset('images/logo.png', height: 40,),
        ),

      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Conditionally render the image based on the focus state
            // if (!isTextFieldFocused)
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/signin.png',
                  height: 155,
                ),
              ),
            SizedBox(height: 20),

            buildTextField('Email', emailController, focusNode: emailFocusNode),
            SizedBox(height: 20),
            buildTextField('Password', passwordController, obscureText: true, focusNode: passwordFocusNode),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                signIn();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff67322),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10,),
            if(!isTextFieldFocused)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff272727),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      // Handle sign in action
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {bool obscureText = false, FocusNode? focusNode}) {
    return Container(
      child: Material(
        color: Color(0xfff2f2f2),
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 9),
          ),
        ),
      ),
    );
  }
}

