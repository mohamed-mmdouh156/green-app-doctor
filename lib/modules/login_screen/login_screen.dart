import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenappdoctor/layouts/homePageLayout/cubit_cubit.dart';
import 'package:greenappdoctor/shared/shared_preferences/cash_helper.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var email, password;

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  bool obsertext = true;

  SignIn() async {
    var formDate = _formkey.currentState;
    if (_formkey.currentState!.validate()) {
      formDate?.save();
      try {
         FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password).then((value) {
           uId = value.user!.uid;
           print('siiiiiiiiiiiiiiiiiiiiiiiiiii');
           print(uId);
           print('siiiiiiiiiiiiiiiiiiiiiiiiiii');
           CashHelper.saveData(key: 'uId',value: uId!);
           print(CashHelper.getData(key: 'uId'));

        });
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        return userCredential;
      } on FirebaseException catch (error) {
        if (error.code == 'user-not-found') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            title: 'Error',
            desc: "No user found for that email , please check it again .",
            btnOkColor: Colors.red,
            btnOkOnPress: () {
              print("error has shown");
            },
          ).show();
        } else if (error.code == 'wrong-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            title: 'Error',
            desc: "Wrong password provided for that user .",
            btnOkColor: Colors.red,
            btnOkOnPress: () {
              print("error has shown");
            },
          ).show();
        }
      }
    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipPath(
                    clipper: MyCustomeClipper(),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("lib/shared/styles/images/2 - Copy.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                      top: 38,
                      left: 12,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, 'IntroScreen');
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ))
                ],
              ),
              defaultText(
                  text: "Welcome back",
                  color: const Color(0xff245D18),
                  fontsize: 40),
              defaultText(
                  text: "Login to your account",
                  color: const Color(0xff416F46),
                  fontsize: 20),
              const SizedBox(
                height: 40,
              ),
              defaulttextform(
                icon: Icons.mail_sharp,
                labeltext: "E-Mail",
                controller: emailcontroller,
                textInputType: TextInputType.name,
                onChanged: (val) {
                  print(val);
                },
                validator: (value) {
                  if (value == "") {
                    return "E-Mail is required ";
                  }
                  return null;
                },
                onSubmit: (value) {},
                inputFormatters: [],
                onSaved: (val) {
                  email = val;
                },
              ),
              defaulttextform(
                icon: Icons.lock_open_sharp,
                obscureText: obsertext,
                labeltext: "Password",
                textInputType: TextInputType.visiblePassword,
                onSubmit: (value) {
                  password = value;
                },
                onChanged: (val) {
                  print(val);
                },
                inputFormatters: [],
                validator: (value) {
                  if (value == "") {
                    return "password must not be empty ";
                  } else if (value!.length <= 6) {
                    return "the password must be more than 6";
                  }
                  return null;
                },
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      obsertext = !obsertext;
                    });
                  },
                  child: Icon(
                      obsertext == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xff416F46)),
                ),
                controller: passwordcontroller,
                onSaved: (val) {
                  password = val ;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xff416F46),
                    size: 15,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  defaultText(
                      text: "Remember me", color: Colors.black, fontsize: 13),
                  const SizedBox(
                    width: 120,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Courgette',
                            color: Colors.blue),
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              defaultElevatedButton(
                  text: "Log In",
                  onprimary: Colors.white,
                  top: 10,
                  primary: const Color(0xff255E3A),
                  color: Colors.white,
                  onPress: () async {
                    var user = await SignIn();
                    if(user != null){
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.SUCCES,
                        animType: AnimType.SCALE,
                        title: 'Login successfully',
                        desc: "welcome to our Green Doctor App",
                        btnOkOnPress: () {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(uId).get()
                              .then((value) {
                            print(value['email']);
                            print(value['name']);
                            print(value['phone']);
                            CashHelper.saveData(key: 'userEmail',value: value['email']);
                            CashHelper.saveData(key: 'userName',value: value['name']);
                            CashHelper.saveData(key: 'userPhone',value: value['phone']);

                            Navigator.pushReplacementNamed(context, 'HomePageLayout');
                          }).catchError((error) {
                            print('Error is ${error.toString()}');
                          });
                        },
                      ).show();
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultText(
                        text: " Don't have an account ?",
                        color: const Color(0xff416F46),
                        fontsize: 13),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, 'SignUpScreen');
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Courgette',
                            color: Colors.blue),
                      ),
                    )
                  ]),
            ])),
      ),
    );
  }
}

class MyCustomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
