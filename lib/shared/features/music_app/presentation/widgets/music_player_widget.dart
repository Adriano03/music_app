import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:music_app/core/app/music_app_colors.dart';

import 'package:music_app/shared/models/music_model.dart';

class MusicPlayerWidget extends StatelessWidget {
  final MusicModel music;

  const MusicPlayerWidget({
    Key? key,
    required this.music,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 25,
        sigmaY: 25,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: Get.back,
                  icon: const Icon(Icons.arrow_downward_outlined),
                  color: MusicAppColors.secondaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}