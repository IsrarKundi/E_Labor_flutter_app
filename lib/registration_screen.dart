import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}
class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Define a focus node for each text field
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();


  // Define a variable to track whether any text field is focused
  bool isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();

    // Add listeners to each focus node to update the focus state
    nameFocusNode.addListener(updateTextFieldFocus);
    emailFocusNode.addListener(updateTextFieldFocus);
    passwordFocusNode.addListener(updateTextFieldFocus);
    confirmPasswordFocusNode.addListener(updateTextFieldFocus);
  }

  @override
  void dispose() {
    // Dispose focus nodes
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  // Function to update the focus state when any text field is focused
  void updateTextFieldFocus() {
    setState(() {
      isTextFieldFocused = nameFocusNode.hasFocus ||
          emailFocusNode.hasFocus ||
          passwordFocusNode.hasFocus ||
          confirmPasswordFocusNode.hasFocus;
    });
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Conditionally render the image based on the focus state
            if (!isTextFieldFocused)
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/registration.png',
                  height: 160,
                ),
              ),
            SizedBox(height: 20),
            buildTextField('Name', nameController, focusNode: nameFocusNode),
            SizedBox(height: 20),
            buildTextField('Email', emailController, focusNode: emailFocusNode),
            SizedBox(height: 20),
            buildTextField('Password', passwordController, obscureText: true, focusNode: passwordFocusNode),
            SizedBox(height: 20),
            buildTextField('Confirm Password', confirmPasswordController, obscureText: true, focusNode: confirmPasswordFocusNode),
            SizedBox(height: 28),
            ElevatedButton(
              onPressed: () {
                // Registration logic
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
                'Register',
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
                    'Already have an account?',
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
                      'Sign in',
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


