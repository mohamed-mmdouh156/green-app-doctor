import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:greenappdoctor/shared/shared_preferences/cash_helper.dart';
import 'layouts/homePageLayout/homepagelayout.dart';
import 'modules/caring_screen/caring_screen.dart';
import 'modules/decoration_plants_collection_screen/decoration_plants_screen.dart';
import 'modules/diagnoss_screen/diagnoss_screen.dart';
import 'modules/favourits_screen/favourits_screen.dart';
import 'modules/fruit_item_represent/fruit_item_represent.dart';
import 'modules/fruits_collection_screen/fruitsCollectionScreen.dart';
import 'modules/homepage_screen/homepage_screen.dart';
import 'modules/intro_screen/intro_screen.dart';
import 'modules/log_out_Screen/log_out_screen.dart';
import 'modules/login_screen/login_screen.dart';
import 'modules/profile_screen/profile_screen.dart';
import 'modules/signup_screen/signup_screen.dart';
import 'modules/splash_screen/splash_screen.dart';
import 'modules/vegetables_collection_screen/vegetables_collection_screen.dart';

bool islogin = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else if (islogin != null) {
    islogin = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: islogin == false ? const SplashScreen() : HomePageLayout(),
      routes: {
        'SplashScreen': (context) => const SplashScreen(),
        'IntroScreen': (context) => const IntroScreen(),
        'LoginScreen': (context) => const LoginScreen(),
        'SignUpScreen': (context) => const SignUpScreen(),
        'HomePageLayout': (context) => HomePageLayout(),
        'CaringScreen': (context) => const CaringScreen(),
        'FavouritsScreen': (context) => const FavouritsScreen(),
        'DiagnossScreen': (context) => const DiagnossScreen(),
        'HomePageScreen': (context) => const HomePageScreen(),
        'LogoutScreen': (context) => const LogOutScreen(),
        'ProfileScreen': (context) => ProfileScreen(),
        'FruitsCollectionScreen': (context) =>  const FruitsCollectionScreen(),
        'VegetablesCollectionScreen': (context) => const VegetablesCollectionScreen(),
        'DecorationPlantsCollectionScreen': (context) => const DecorationPlantsCollectionScreen(),
      },
    );
  }
}
