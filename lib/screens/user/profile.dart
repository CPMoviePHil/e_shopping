import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';

class UserProfile extends StatelessWidget {

  final String imagePath;
  final double? size;

  const UserProfile({
    required this.imagePath,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: AppLibScreen.onlineImage(
          onlineImage: imagePath,
          size: size,
        ),
      ),
    );
  }
}