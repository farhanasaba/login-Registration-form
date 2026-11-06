import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB2DFDB),
              Color(0xFF80CBC4),
              Color(0xFF4DB6AC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),

            child: Card(
              elevation: 12,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),

              child: Padding(
                padding: EdgeInsets.all(25),

                child: Form(
                  key: _formKey,

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // Registration Icon
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xFFE0F2F1),
                        child: Icon(
                          Icons.person_add_alt_1,
                          size: 45,
                          color: Color(0xFF00897B),
                        ),
                      ),

                      SizedBox(height: 15),

                      // Heading
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00695C),
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        'Register to get started',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),

                      SizedBox(height: 25),

                      // Name Field
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person_outline),
                          filled: true,
                          fillColor: Color(0xFFF1F8F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }

                          String pattern = r'^[a-zA-Z ]+$';

                          if (!RegExp(pattern).hasMatch(value)) {
                            return 'Only letters and spaces are allowed';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // Email Field
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email_outlined),
                          filled: true,
                          fillColor: Color(0xFFF1F8F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }

                          String pattern =
                              r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$';

                          if (!RegExp(pattern).hasMatch(value)) {
                            return 'Please enter a valid email';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // Password Field
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          filled: true,
                          fillColor: Color(0xFFF1F8F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }

                          String pattern =
                              r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$';

                          if (!RegExp(pattern).hasMatch(value)) {
                            return 'Use 8 characters, uppercase, lowercase, number and symbol';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // Confirm Password Field
                      TextFormField(
                        controller: confirmController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock_person_outlined),
                          filled: true,
                          fillColor: Color(0xFFF1F8F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }

                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 25),

                      // Register Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF00897B),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                          ),

                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Registration Successful!'),
                                  backgroundColor: Colors.teal,
                                ),
                              );

                              Navigator.pop(context);
                            }
                          },

                          child: Text(
                            'CREATE ACCOUNT',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 15),

                      // Login Navigation
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: Text(
                          'Already have an account? Login',
                          style: TextStyle(
                            color: Color(0xFF00897B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
