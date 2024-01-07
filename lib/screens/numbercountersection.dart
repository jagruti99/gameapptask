// ignore_for_file: library_private_types_in_public_api, file_names

import 'dart:async';
import 'package:game_project/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class NumberCounter extends StatefulWidget {
  const NumberCounter({super.key});

  @override
  _NumberCounterState createState() => _NumberCounterState();
}

class _NumberCounterState extends State<NumberCounter> {
  int _counter = 1000;
  final int _endValue = 10000;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _loadCounter();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _incrementCounter();
    });
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 1000;
    });
  }

  void _incrementCounter() {
    setState(() {
      if (_counter < _endValue) {
        _counter++;
        _saveCounter();
      } else {
        _timer.cancel();
      }
    });
  }

  void _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '₹$_counter',
      style: const TextStyle(
          fontSize: 48,
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.bold),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
