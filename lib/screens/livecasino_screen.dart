// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:game_project/reusable_widgets/header.dart';

class LiveCasinoScreen extends StatefulWidget {
  const LiveCasinoScreen({super.key});

  @override
  State<LiveCasinoScreen> createState() => _LiveCasinoScreenState();
}

class _LiveCasinoScreenState extends State<LiveCasinoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Header(headerText: 'Live Casino'),
        ],
      ),
    );
  }
}
