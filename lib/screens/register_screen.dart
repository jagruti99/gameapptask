// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:game_project/reusable_widgets/header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Header(headerText: 'Register'),
        ],
      ),
    );
  }
}
