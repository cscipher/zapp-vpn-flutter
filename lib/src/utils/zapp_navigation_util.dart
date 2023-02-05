import 'package:flutter/material.dart';

class ZappNavigate {
  ZappNavigate._();

  static void to(BuildContext context, String path) =>
      Navigator.pushNamed(context, path);
}
