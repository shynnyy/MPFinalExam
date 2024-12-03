
import 'package:firebase_auth/firebase_auth.dart';
import 'Signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Signup> {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String fullName = '';
  String phoneNumber = '';
  String role = 'Student';  // Default role is 'Student'
  String studentId = '';
  String batch = '';
  bool termsAccepted = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _batchController = TextEditingController();

  Future<void> onPressedSignUp() async {
    if (email.isEmpty || password.isEmpty || fullName.isEmpty || phoneNumber.isEmpty || confirmPassword.isEmpty) {
      const snackBar = SnackBar(content: Text('Please fill in all fields.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (password != confirmPassword) {
      const snackBar = SnackBar(content: Text('Passwords do not match.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (!termsAccepted) {
      const snackBar = SnackBar(content: Text('You must accept the terms and conditions.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // // Perform Firebase authentication or any other backend logic
    // // Uncomment and implement the following when you enable Firebase
    // /*
    // try {
    //   User? user = await FirebaseAuthService().registerUser(
    //     email: email,
    //     password: password,
    //     fullName: fullName,
    //     phoneNumber: phoneNumber,
    //   );
    //   if (user != null) {
    //     const snackBar = SnackBar(content: Text('Registration successful.'));
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const SignIn()),
    //     );
    //   }
    // } catch (e) {
    //   const snackBar = SnackBar(content: Text('Error during registration.'));
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // }
    // */
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

  void onChangedConfirmPassword(String value) {
    setState(() {
      confirmPassword = value;
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

  void onChangedRole(String? value) {
    setState(() {
      role = value ?? 'Student'; // Default to 'Student' if value is null
    });
  }

  void onChangedStudentId(String value) {
    setState(() {
      studentId = value;
    });
  }

  void onChangedBatch(String value) {
    setState(() {
      batch = value;
    });
  }

  void onChangedTerms(bool? value) {
    setState(() {
      termsAccepted = value ?? false; // Default to 'false' if value is null
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            Container(
              alignment: Alignment.centerLeft,  // Ensuring the dropdown is aligned to the left
              child: DropdownButton<String>(
                value: role,
                items: ['Student', 'Lecturer'].map((String role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: onChangedRole,
              ),
            ),
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
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm your password'),
              onChanged: onChangedConfirmPassword,
            ),
            TextField(
              controller: _studentIdController,
              decoration: const InputDecoration(labelText: 'Enter your ID'),
              onChanged: onChangedStudentId,
            ),
            if (role == 'Student') ...[
              TextField(
                controller: _batchController,
                decoration: const InputDecoration(labelText: 'Enter your batch'),
                onChanged: onChangedBatch,
              ),
            ],
            Row(
              children: [
                Checkbox(
                  value: termsAccepted,
                  onChanged: onChangedTerms,
                ),
                const Text('I accept the terms and conditions')
              ],
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
            const Spacer(),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('© 2024 YourAppName - All Rights Reserved'),
            ),
          ],
        ),
      ),
    );
  }
}
