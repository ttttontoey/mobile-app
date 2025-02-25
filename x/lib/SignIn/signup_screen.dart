import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});

final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      // child: Padding(
      //   padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Text("ee",textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                    ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: nameController,
              obscureText: false,
              decoration: InputDecoration(
                label:Text("Name"),
                hintText: "Enter your name",
              ),
            )
          ],
        ),
      // ),
    );
  }
}
