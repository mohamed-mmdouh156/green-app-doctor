import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LogOutScreen extends StatelessWidget {
  const LogOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff9DDBB5),
          image: DecorationImage(
            image: AssetImage("llib/shared/styles/images/3 - Copy.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Icon(
                  Icons.local_florist_sharp,
                  size: 100,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Green Doctor",
                style: TextStyle(
                    fontFamily: 'Courgette-Regular',
                    fontSize: 30,
                    color: Colors.green[800]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: 320,
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "  Are you sure you , ",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.green[800],
                          fontFamily: 'Courgette-Regular'),
                    ),
                    Text(
                      "want to logout",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.green[800],
                          fontFamily: 'Courgette-Regular'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, 'HomePageLayout');
                            },
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: Colors.green[800],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: 'Courgette-Regular'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacementNamed('IntroScreen');
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                primary: Colors.green[800],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: const Text('Logout',
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Courgette-Regular')),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ))
    ]));
  }
}
