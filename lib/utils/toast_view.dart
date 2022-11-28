import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

extension ToastX on BuildContext {
  void showPokemonAdded() => MotionToast(
        icon: Icons.check,
        primaryColor: Colors.white,
        secondaryColor: Colors.green,
        backgroundType: BackgroundType.solid,
        title: Text(
          'Success!',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        description: Text(
          'Added Pokemon to Favorites!',
          style: TextStyle(color: Colors.black),
        ),
      ).show(this);

  void showPokemonRemoved() => MotionToast(
        icon: Icons.check,
        primaryColor: Colors.white,
        secondaryColor: Colors.green,
        backgroundType: BackgroundType.solid,
        title: Text(
          'Success!',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        description: Text(
          'Removed Pokemon from Favorites!',
          style: TextStyle(color: Colors.black),
        ),
      ).show(this);

  void showPokemonExistedMessage() => MotionToast(
        icon: Icons.close,
        primaryColor: Colors.white,
        secondaryColor: Colors.red,
        backgroundType: BackgroundType.solid,
        title: Text(
          'Failed!',
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),
        description: Text(
          'Pokemon is Already Added to Favorites!',
          style: TextStyle(color: Colors.red),
        ),
      ).show(this);
}
