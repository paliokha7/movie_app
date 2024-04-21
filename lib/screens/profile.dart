import 'package:flutter/material.dart';
import 'package:task_4/theme/appcolors.dart';
import 'package:task_4/widgets/profile_button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          color: AppColors.button,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey,
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Sarah Clay',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const ProfileButton(text: 'Account Details'),
            const ProfileButton(text: 'Gifts'),
            GestureDetector(
              child: const ProfileButton(text: 'Settings'),
              onTap: () {
                Navigator.of(context).pushNamed('/settings');
              },
            ),
            const ProfileButton(text: 'Support'),
            const ProfileButton(text: 'Log Out'),
          ],
        ),
      ),
    );
  }
}
