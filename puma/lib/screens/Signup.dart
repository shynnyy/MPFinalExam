import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:final_project/utils/firebase_auth_service.dart';
import 'Signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Signup> {
  String email = '';
  String password = '';
  String fullName = '';
  String phoneNumber = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<void> onPressedSignUp() async {
    if (email.isEmpty || password.isEmpty || fullName.isEmpty || phoneNumber.isEmpty) {
      const snackBar = SnackBar(content: Text('Please fill in all fields.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // Uncomment the following lines to enable Firebase functionality:
    /*
    try {
      User? user = await FirebaseAuthService().registerUser(
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: phoneNumber,
      );
      if (user != null) {
        const snackBar = SnackBar(content: Text('Registration successful.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const signin()),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(content: Text('Error during registration.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    */
  }

  void onChangedEmail(String value) {
    setState(() {
      email = value;
    });
  }

  void onChangedPassword(String value) {
    setState(() {
      password = value;
    });
  }

  void onChangedFullName(String value) {
    setState(() {
      fullName = value;
    });
  }

  void onChangedPhoneNumber(String value) {
    setState(() {
      phoneNumber = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Enter your email'),
            onChanged: onChangedEmail,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Enter your password'),
            onChanged: onChangedPassword,
          ),
          TextField(
            controller: _fullNameController,
            decoration: const InputDecoration(labelText: 'Enter your full name'),
            onChanged: onChangedFullName,
          ),
          TextField(
            controller: _phoneNumberController,
            decoration: const InputDecoration(labelText: 'Enter your phone number'),
            onChanged: onChangedPhoneNumber,
          ),
          ElevatedButton(
            onPressed: onPressedSignUp,
            child: const Text('Sign Up'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignIn()),
              );
            },
            child: const Text('Already have an account? Sign In'),
          ),
        ],
      ),
    );
  }
}
