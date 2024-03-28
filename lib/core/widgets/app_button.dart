import 'package:flutter/material.dart';
import '../widgets/app_sizer.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String btnName;
  final IconData icon;
  const AppButton(
      {super.key,
      required this.onTap,
      required this.btnName,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const WidthBox(12),
              Text(
                btnName,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
