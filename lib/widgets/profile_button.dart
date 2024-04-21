import 'package:flutter/material.dart';
import 'package:task_4/theme/appcolors.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  const ProfileButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(0.9, 0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF57636C),
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
