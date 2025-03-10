import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mytravel/screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Explore the World with Ease",
              body:
                  "Discover breathtaking destinations, hidden gems, and unforgettable experiences. Let your journey begin with just a few taps!",
              image: buildImage('assets/images/7.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Plan Your Perfect Trip",
              body:
                  "From flights and hotels to local attractions, we provide everything you need for a hassle-free adventure. Travel smarter and stress-free!",
              image: buildImage('assets/images/9.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Find the Best Deals",
              body:
                  "Save more with exclusive offers on flights, hotels, and activities. We help you travel for less without compromising on experience!",
              image: buildImage('assets/images/8.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Explore Places Near You",
              body:
                  "Discover must-visit spots, restaurants, and exciting activities around you. Make every moment of your journey count!",
              image: buildImage('assets/images/10.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Plan Your Itinerary with Ease",
              body:
                  "Use smart maps and personalized travel guides to ensure you never miss a must-see location or exciting adventure!",
              image: buildImage('assets/images/11.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Make Every Journey Memorable",
              body:
                  "Capture moments, share your experiences, and connect with fellow travelers. Start exploring today and create stories worth telling!",
              image: buildImage('assets/images/12.jpg'),
              decoration: getPageDecoration(),
            ),
          ],
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Icon(Icons.arrow_forward),
          dotsDecorator: getDotsDecorator(),
        ),
      ),
    );
  }

  void goToHome(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const SignInPage()),
    );
  }

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 250));

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
        imagePadding: EdgeInsets.all(20),
      );

  DotsDecorator getDotsDecorator() => DotsDecorator(
        size: const Size(10, 10),
        color: Colors.grey,
        activeSize: const Size(22, 10),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      );
}
