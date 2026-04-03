import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('get')),
      backgroundColor: Colors.blue,
      body: Center(
        child: SvgPicture.asset(
          'assets/svg/1692130.svg',
          width: 100.0,
          height: 100.0,
          colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
        ),
      ),
    );
  }
}
