import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/signup_screen%20copy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/mybutton.dart';
import '../widgets/mytextfield.dart';
import 'home_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final String txtMsg = "";

  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: pwdController.text);
      print("SignIn Successfully!");

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                "Sign In",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Good to see you again! Sign in to pick up where you left off.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: emailController,
                labelText: "Email",
                hintText: "Enter Your Email",
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: pwdController,
                labelText: "Password",
                hintText: "Enter Your Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight, // จัดให้อยู่ขวาสุด
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forget Password?"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MyButton(
                onTap: () {
                  signInWithEmailAndPassword();
                },
                labelText: 'Sign In',
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member?"),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SignUpPage()), // ไปหน้า Sign In
                      );
                    },
                    child: const Text("Register Now!"),
                  ),
                ],
              ),
            ],
          ),
          // ),
        ),
      ),
    );
  }
}
