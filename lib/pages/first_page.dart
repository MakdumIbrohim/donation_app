import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:donation_app/constants/app_colors.dart';
import 'package:donation_app/widgets/forms/login_form.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

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
            const SizedBox(height: 20.0),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
