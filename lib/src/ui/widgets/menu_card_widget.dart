import 'package:braincarrier/src/ui/util/app_colors.dart';
import 'package:braincarrier/src/ui/util/style.dart';
import 'package:flutter/material.dart';

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 180,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: primaryColor.withOpacity(.7),
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.jpg',
                height: 80,
                width: 140,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: titleTextStyle.copyWith(
                      fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
