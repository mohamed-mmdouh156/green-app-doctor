import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 210,
          width: double.infinity,
          color: const Color(0xff449464),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          AssetImage("lib/shared/styles/images/profile.jpg"),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                         color: Color(0xff255E3A),
                          size: 35,
                        ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: Text(
                    getUser(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: "Courgette"),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          title: const Text(
            "Settings",
            style: TextStyle(
                fontSize: 22,
                color: Color(0xff416F46),
                fontFamily: "Courgette"),
          ),
          leading: const Icon(
            Icons.settings,
            color: Color(0xff416F46),
            size: 25,
          ),
          onTap: () {},
        ),
        const SizedBox(
          height: 12,
        ),
        ListTile(
          title: const Text(
            "Profile",
            style: TextStyle(
                fontSize: 22,
                color: Color(0xff416F46),
                fontFamily: "Courgette"),
          ),
          leading: const Icon(
            Icons.person_pin_circle_rounded,
            color: Color(0xff416F46),
            size: 30,
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, 'ProfileScreen');
          },
        ),
        const SizedBox(
          height: 12,
        ),
        ListTile(
          title: const Text(
            "Info",
            style: TextStyle(
                fontSize: 22,
                color: Color(0xff416F46),
                fontFamily: "Courgette"),
          ),
          leading: const Icon(
            Icons.info,
            color: Color(0xff416F46),
            size: 25,
          ),
          onTap: () {},
        ),
        const SizedBox(
          height: 12,
        ),
        ListTile(
          title: const Text(
            "Contact_us",
            style: TextStyle(
                fontSize: 22,
                color: Color(0xff416F46),
                fontFamily: "Courgette"),
          ),
          leading: const Icon(
            Icons.message,
            color: Color(0xff416F46),
            size: 25,
          ),
          onTap: () {},
        ),
        const SizedBox(
          height: 12,
        ),
        ListTile(
          title: const Text(
            "Log Out",
            style: TextStyle(
                fontSize: 22,
                color: Color(0xff416F46),
                fontFamily: "Courgette"),
          ),
          leading: const Icon(
            Icons.exit_to_app_rounded,
            color: Color(0xff416F46),
            size: 25,
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, 'LogoutScreen');
          },
        )
      ],
    );
  }
}
