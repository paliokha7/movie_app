import 'package:flutter/material.dart';
import 'package:task_4/screens/profile.dart';
import 'package:task_4/screens/settings.dart';

class ProfileNavigator extends StatelessWidget {
  const ProfileNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              if (settings.name == "/settings") {
                return const Settings();
              }
              return const Profile();
            });
      },
    );
  }
}
