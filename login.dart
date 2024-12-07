import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorMessage = '';

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // Update display name for the user
        await userCredential.user
            ?.updateDisplayName(_emailController.text.trim());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          setState(() => errorMessage = 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          setState(() =>
              errorMessage = 'The account already exists for that email.');
        } else {
          setState(() => errorMessage = 'An error occurred: ${e.message}');
        }
      } catch (e) {
        setState(() => errorMessage = 'An unexpected error occurred.');
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/favicon3.png', // Add your logo image path here
                      width: 120,
                      height: 90,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Quick Medical",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Description Text
              const Text(
                "Please Enter your Mobile Number\nto Login/Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              // Phone Number Input Field
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black12,
              //         blurRadius: 10,
              //         offset: Offset(0, 5),
              //       ),
              //     ],
              //   ),
              //   child: TextField(
              //     keyboardType: TextInputType.phone,
              //     decoration: InputDecoration(
              //       hintText: "+91 9265614292",
              //       hintStyle: TextStyle(color: Colors.black45),
              //       border: InputBorder.none,
              //       prefixIcon: Icon(Icons.phone, color: Colors.black45),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 30),

              // Email Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an email address' : null,
                  decoration: const InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: TextStyle(color: Colors.black45),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email, color: Colors.black45),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) =>
                      value!.isEmpty ? 'PLease Enter a Password' : null,
                  decoration: const InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: TextStyle(color: Colors.black45),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock, color: Colors.black45),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Sign-Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    register();
                    Navigator.pushNamed(context, '/dashboard');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4157FF),
                    foregroundColor: Colors.white,
                    iconColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.blueAccent.withOpacity(0.9),
                    elevation: 10,
                  ),
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    register();
                    Navigator.pushNamed(context, '/register');
                  },
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: Colors.white10,
                  //   // foregroundColor: Colors.white,
                  //   // shape: RoundedRectangleBorder(
                  //   //   borderRadius: BorderRadius.circular(30),
                  //   // ),
                  //   // shadowColor: Colors.green.withOpacity(0.9),
                  //   // elevation: 10,
                  // ),
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    ));
