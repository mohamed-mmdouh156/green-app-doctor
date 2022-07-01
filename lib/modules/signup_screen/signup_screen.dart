import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenappdoctor/modules/signup_screen/sign_up_cubit.dart';

import '../../shared/components/components.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var name, email, password, phone;

  final _formKey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignupErrorState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.SCALE,
              title: 'Error',
              desc: state.error,
              btnOkColor: Colors.red,
              btnOkOnPress: () {
                print("error shown");
              },
            ).show();
          } else if (state is SignupCreateUserSuccessState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.TOPSLIDE,
              title: 'success',
              desc: 'Register is success ',
              btnOkOnPress: () {
                Navigator.pushReplacementNamed(context, 'LoginScreen');
              },
            ).show();
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffF7F7F7),
            body: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF7F7F7),
                ),
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                ClipPath(
                                  clipper: MyCustomeClipper(),
                                  child: Container(
                                    width: double.infinity,
                                    height: 220,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "lib/shared/styles/images/2 - Copy.png"),
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
                                text: "Register",
                                color: const Color(0xff245D18)),
                            defaultText(
                                text: "Create your new account",
                                color: const Color(0xff245D18),
                                fontsize: 20),
                            Column(
                              children: [
                                defaulttextform(
                                  icon: Icons.person,
                                  labeltext: "Full Name",
                                  controller: namecontroller,
                                  textInputType: TextInputType.name,
                                  onChanged: (val) {
                                    print(val);
                                  },
                                  suffix: null,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r"[a-zA-Z]+|\s"),
                                    )
                                  ],
                                  validator: (value) {
                                    if (value == "") {
                                      return "Full Name must not be empty ";
                                    }
                                    return null;
                                  },
                                  onSubmit: (value) {},
                                  onSaved: (val) {
                                    name = val;
                                  },
                                ),
                                defaulttextform(
                                  icon: Icons.email_sharp,
                                  labeltext: "E-mail",
                                  textInputType: TextInputType.name,
                                  controller: emailcontroller,
                                  onSubmit: (value) {},
                                  onChanged: (val) {
                                    print(val);
                                  },
                                  inputFormatters: [],
                                  validator: (value) {
                                    if (value == "") {
                                      return "E-Mail must not be empty ";
                                    }
                                    return null;
                                  },
                                  suffix: null,
                                  onSaved: (val) {
                                    email = val;
                                  },
                                ),
                                const SizedBox(),
                                defaulttextform(
                                  icon: Icons.phone,
                                  labeltext: "Phone Number",
                                  textInputType: TextInputType.phone,
                                  controller: phonecontroller,
                                  suffix: null,
                                  onSubmit: (value) {},
                                  onChanged: (val) {
                                    print(val);
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r"[0-9]"),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == "") {
                                      return "phone must not be empty ";
                                    } else if (value!.length < 11 ||
                                        value.length > 11) {
                                      return "phone number must be 11 ";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    phone = val;
                                  },
                                ),
                                const SizedBox(),
                                defaulttextform(
                                  icon: Icons.lock_open_sharp,
                                  labeltext: "Password",
                                  textInputType: TextInputType.visiblePassword,
                                  controller: passwordcontroller,
                                  suffix: SignUpCubit.get(context).changePasswordVisability(),
                                  onSubmit: (value) {},
                                  onChanged: (val) {
                                    print(val);
                                  },
                                  inputFormatters: [],
                                  validator: (value) {
                                    if (value == "") {
                                      return "password must not be empty ";
                                    } else if (value!.length < 6) {
                                      return "password must be more than 6";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    password = val;
                                  },
                                ),
                                const SizedBox(),
                              ],
                            ),
                            const SizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                defaultText(
                                    text: "by signing you agree to our",
                                    color: Colors.black,
                                    fontsize: 13),
                                const SizedBox(
                                  width: 2,
                                ),
                                defaultText(
                                    text: "team of use ",
                                    color: const Color((0xff416F46)),
                                    fontsize: 13),
                              ],
                            ),
                            defaultText(
                              text: "and privacy notice",
                              color: const Color((0xff416F46)),
                              fontsize: 13,
                            ),
                            ConditionalBuilder(
                              condition: state is! SignupLodingState,
                              builder: (context) => defaultElevatedButton(
                                text: "Sign Up",
                                onprimary: Colors.white,
                                top: 10,
                                primary: const Color(0xff255E3A),
                                onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                    print(namecontroller.text);
                                    print(emailcontroller.text);
                                    print(passwordcontroller.text);
                                    print(phonecontroller.text);
                                    SignUpCubit.get(context).userRegister(
                                        name: namecontroller.text
                                            .toString()
                                            .trim(),
                                        email: emailcontroller.text
                                            .toString()
                                            .trim(),
                                        phone: phonecontroller.text
                                            .toString()
                                            .trim(),
                                        password: passwordcontroller.text
                                            .toString()
                                            .trim());
                                  }
                                },
                                color: Colors.white,
                              ),
                              fallback: (BuildContext context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ])),
                )),
          );
        },
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
