import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/signup_screen%20copy.dart';

import '../widgets/mybutton.dart';
import '../widgets/mytextfield.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

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
                controller: nameController,
                labelText: "Name",
                hintText: "Enter Your Name",
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
                onTap: () {},
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
                                SignUpPage()), // ไปหน้า Sign In
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
