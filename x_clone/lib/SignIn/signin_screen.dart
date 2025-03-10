import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screens/home_screen.dart';
import 'forgot_password.dart';
import 'signup_screen copy.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                "Sign In",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Good to see you again! Sign in to continue.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[400],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Username Input
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: const TextStyle(color: Colors.white),
                  hintText: "Enter Your Name",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Password Input
              TextField(
                controller: pwdController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: const TextStyle(color: Colors.white),
                  hintText: "Enter Your Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Sign In Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a member?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register Now!",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../home_screens/home_screen.dart';
// import '../widget/mybutton.dart';
// import '../widget/mytextfield.dart';
// import 'signup_screen copy.dart';

// class SignInPage extends StatelessWidget {
//   SignInPage({super.key});

//   final nameController = TextEditingController();
//   final pwdController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 40),
//         child: Form(
//           child: Column(
//             children: [
//               const SizedBox(height: 80),
//               Text(
//                 "Sign In",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.lato(
//                   textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w800,
//                         fontStyle: FontStyle.normal,
//                       ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 "Good to see you again! Sign in to pick up where you left off.",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.lato(
//                   textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w300,
//                         fontStyle: FontStyle.italic,
//                       ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               MyTextField(
//                 controller: nameController,
//                 labelText: "Name",
//                 hintText: "Enter Your Name",
//                 obscureText: false,
//               ),
//               const SizedBox(height: 20),
//               MyTextField(
//                 controller: pwdController,
//                 labelText: "Password",
//                 hintText: "Enter Your Password",
//                 obscureText: true,
//               ),
//               const SizedBox(height: 15),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: const Text("Forget Password?"),
//                 ),
//               ),
//               const SizedBox(height: 15),

//               /// 🔥 เพิ่มการนำทางไปหน้า Home เมื่อกดปุ่ม Sign In
//               MyButton(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HomeScreen(), // ไปหน้า Home
//                     ),
//                   );
//                 },
//                 labelText: 'Sign In',
//               ),

//               const SizedBox(height: 2),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Not a member?"),
//                   const SizedBox(width: 2),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SignUpPage(), // ไปหน้า Sign Up
//                         ),
//                       );
//                     },
//                     child: const Text("Register Now!"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
