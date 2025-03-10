import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/mybutton.dart';
import '../widgets/mytextfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final repwdController = TextEditingController();

  signUpWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: pwdController.text);
      print("created accounnt");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) =>  const SignInPage()),
      );
    } on FirebaseAuthException catch (e) {
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
                "Sign Up",
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
                "Sign up now and enjoy exclusive benefits.",
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
                controller: nameController,
                labelText: "Name",
                hintText: "Enter Your Name",
                obscureText: false,
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
                height: 20,
              ),
              MyTextField(
                controller: repwdController,
                labelText: "Confirm Password",
                hintText: "Enter Your Password Again",
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                onTap: () {
                  signUpWithEmailAndPassword();
                },
                labelText: 'Sign Up',
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have a member?"),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SignInPage()), // ไปหน้า Sign In
                      );
                    },
                    child: const Text("Sign In"),
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
