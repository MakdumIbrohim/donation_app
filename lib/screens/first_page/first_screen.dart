import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:donation_app/constant/app_colors.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('get')),
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/1692130.svg',
              width: 100.0,
              height: 100.0,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Masukkan username',
                labelText: 'Username'
              ),
            )
          ],
        ),
      ),
    );
  }
}
