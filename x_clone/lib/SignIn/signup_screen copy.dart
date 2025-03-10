import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'signin_screen.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController repwdController = TextEditingController();

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
                Icons.account_circle,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                "Sign Up",
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
                "Create an account to get started!",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[400],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Name Input
              _buildTextField(nameController, "Name", "Enter Your Name"),
              const SizedBox(height: 15),

              // Email Input
              _buildTextField(emailController, "Email", "Enter Your Email"),
              const SizedBox(height: 15),

              // Password Input
              _buildTextField(pwdController, "Password", "Enter Your Password", obscureText: true),
              const SizedBox(height: 15),

              // Confirm Password Input
              _buildTextField(repwdController, "Confirm Password", "Enter Your Password Again", obscureText: true),
              const SizedBox(height: 25),

              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  // Add Sign Up Logic Here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign In",
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

  // Reusable TextField Widget
  Widget _buildTextField(TextEditingController controller, String label, String hint, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../widget/mybutton.dart';
// import '../widget/mytextfield.dart';
// import 'signin_screen.dart';

// class SignUpPage extends StatelessWidget {
//   SignUpPage({super.key});

//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final pwdController = TextEditingController();
//   final repwdController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 40),
//         child: Form(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 80,
//               ),
//               Text(
//                 "Sign Up",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.lato(
//                   textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w800,
//                         fontStyle: FontStyle.normal,
//                       ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Sign up now and enjoy exclusive benefits.",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.lato(
//                   textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w300,
//                         fontStyle: FontStyle.italic,
//                       ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               MyTextField(
//                 controller: nameController,
//                 labelText: "Name",
//                 hintText: "Enter Your Name",
//                 obscureText: false,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               MyTextField(
//                 controller: emailController,
//                 labelText: "Email",
//                 hintText: "Enter Your Email",
//                 obscureText: false,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               MyTextField(
//                 controller: pwdController,
//                 labelText: "Password",
//                 hintText: "Enter Your Password",
//                 obscureText: true,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               MyTextField(
//                 controller: repwdController,
//                 labelText: "Confirm Password",
//                 hintText: "Enter Your Password Again",
//                 obscureText: true,
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               MyButton(
//                 onTap: () {},
//                 labelText: 'Sign Up',
//               ),
//               const SizedBox(
//                 height: 2,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Have a member?"),
//                   const SizedBox(
//                     width: 2,
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 SignInPage()), // ไปหน้า Sign In
//                       );
//                     },
//                     child: const Text("Sign In"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           // ),
//         ),
//       ),
//     );
//   }
// }
