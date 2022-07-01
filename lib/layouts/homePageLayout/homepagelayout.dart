import 'package:flutter/material.dart';
import 'package:pandabar/pandabar.dart';

import '../../modules/caring_screen/caring_screen.dart';
import '../../modules/diagnoss_screen/diagnoss_screen.dart';
import '../../modules/favourits_screen/favourits_screen.dart';
import '../../modules/homepage_screen/homepage_screen.dart';
import '../../modules/identification_plants/IdentificationPlantsScreen.dart';


class HomePageLayout extends StatefulWidget {
  @override
  _HomePageLayoutState createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  String page = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PandaBar(
        buttonColor: Colors.green,
        buttonSelectedColor: Colors.pink,
        fabIcon: const Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
        backgroundColor: Colors.white,
        fabColors: const [Colors.white, Colors.green],
        buttonData: [
          PandaBarButtonData(
            id: 'Home Page',
            icon: Icons.home,
            title: 'Home Page',
          ),
          PandaBarButtonData(
              id: 'Caring', icon: Icons.local_florist, title: 'Plant Care'),
          PandaBarButtonData(
              id: 'Favourits', icon: Icons.favorite, title: 'Favourits'),
          PandaBarButtonData(
              id: 'Diagnoss', icon: Icons.add_box_rounded, title: 'Diagnoss'),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {
          print('done');
          // Navigator.pushReplacementNamed(context, 'CameraScreen');
        },
      ),
      body: Builder(
        builder: (context) {
          switch (page) {
            case 'Caring':
              return const CaringScreen();
            case 'Home Page':
              return const HomePageScreen();
            case 'Favourits':
              return const FavouritsScreen();
            case 'Diagnoss':
              return const DiagnossScreen();
            default:
              return const IdentificationPlantsScreen();
          }
        },
      ),
    );
  }
}
