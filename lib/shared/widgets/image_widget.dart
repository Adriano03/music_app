import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String? img;
  final double width;
  final double height;

  const ImageWidget({
    super.key,
    this.img,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    const String imageAsset = 'assets/images/music_placeholder.png';
    return img != null
        ? FadeInImage(
            placeholder: const AssetImage(imageAsset),
            image: AssetImage(img!),
            width: width,
            height: height,
            fit: BoxFit.cover,
          )
        : Image.asset(
            imageAsset,
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
  }
}
