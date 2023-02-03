import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:food_app_3/HomeScreen/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninAuth extends StatefulWidget {
  const SigninAuth({super.key});

  @override
  State<SigninAuth> createState() => _SigninAuthState();
}

class _SigninAuthState extends State<SigninAuth> {
  get userProvider => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/background.png',
              )),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Sign in to Continue',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    'Vegi',
                    style:
                        TextStyle(fontSize: 50, color: Colors.white, shadows: [
                      BoxShadow(
                        color: Colors.green,
                        offset: Offset(3, 3),
                        blurRadius: 5,
                      )
                    ]),
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Apple,
                        text: "Sign in with Apple",
                        onPressed: () {},
                      ),
                      SignInButton(Buttons.Google, text: "Sign in with Google",
                          onPressed: () async {
                        await signup(context).then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'By Signing in You are agreeing to our',
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                      Text('Terms and Privacy Policy',
                          style: TextStyle(color: Colors.grey.shade800)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<void> signup(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));

        // Getting users credential

        // if (result != null) {
        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (context) => HomePage()));
        // }  // if result not null we simply call the MaterialpageRoute,
        // // for go to the HomePage screen
      }
    } catch (e) {
      print(e);
    }
  }
}
