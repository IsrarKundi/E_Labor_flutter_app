import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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

  // Define a focus node for each password field
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;


  @override
  void initState() {
    super.initState();

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Conditionally render the image based on the focus state
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/registration.png',
                    height: 160,
                  ),
                ),
              SizedBox(height: 20),
              buildTextField('Name', nameController, ),
              SizedBox(height: 20),
              buildTextField('Email', emailController, ),
              SizedBox(height: 20),
              buildTextField('Password', passwordController, obscureText: _isPasswordObscure, onPressed: () {
                setState(() {
                  _isPasswordObscure = !_isPasswordObscure;
                });
              }),
              SizedBox(height: 20),
              buildTextField('Confirm Password', confirmPasswordController, obscureText: _isConfirmPasswordObscure, onPressed: () {
                setState(() {
                  _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
                });
              }),
              SizedBox(height: 28),
              ElevatedButton(
                onPressed: () {
                  registerUser();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 16,
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
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {bool obscureText = false, Function()? onPressed}) {
    return Container(
      child: Material(
        color: Color(0xfff2f2f2),
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 9),
            suffixIcon: obscureText
                ? IconButton(
              onPressed: onPressed,
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
            )
                : null,
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    final String username = nameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    // Make the API request
    final response = await http.post(
      Uri.parse('https://blogs-api-ebon.vercel.app/api/v1/auth/register'),
      body: {
        'username': username,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      },
    );

    if (response.statusCode == 200) {
      // Registration successful, navigate to next screen or show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacementNamed(context, '/login');
      // Optionally, you can navigate to the next screen after successful registration
      // Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Registration failed, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

}


