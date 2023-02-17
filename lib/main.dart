import 'package:flutter/material.dart';
import 'package:food_app_3/providers/product_provider.dart';
import 'package:food_app_3/providers/reiew_cart_provider.dart';
import 'package:food_app_3/providers/users_provider.dart';
import 'package:food_app_3/signinAuth/signin_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Productprovider>(
          create: (context) => Productprovider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SigninAuth(),
      ),
    );
  }
}
