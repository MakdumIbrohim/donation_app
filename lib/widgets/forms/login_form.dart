import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:donation_app/constants/app_colors.dart';
import 'package:donation_app/pages/second_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static const _demoUsername = 'admin';
  static const _demoPassword = '12345';

  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              'Welcome back',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Masuk untuk melanjutkan kebaikan hari ini.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            UsernameField(
              onSaved: (value) => _username = value,
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Username tidak boleh kosong'
                    : null;
              },
            ),
            const SizedBox(height: 16),
            PasswordField(
              isPasswordVisible: _isPasswordVisible,
              onToggleVisibility: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              onSaved: (value) => _password = value,
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Password tidak boleh kosong'
                    : null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    final username = _username?.trim();
                    final password = _password?.trim();

                    if (username == _demoUsername && password == _demoPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login berhasil, selamat datang!'),
                        ),
                      );

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const SecondPage(),
                        ),
                      );
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username atau password salah'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: const Color(0xFF063B35),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  elevation: 0,
                ),
                child: Text('Masuk', style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: const Text('Lupa password?'),
              ),
            ),
        ],
      ),
    );
  }
}

class UsernameField extends StatelessWidget {
  final void Function(String?) onSaved;
  final String? Function(String?) validator;

  const UsernameField({
    super.key,
    required this.onSaved,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return _GlassField(
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: _buildDecoration(
          labelText: 'Username',
          hintText: 'Masukkan Username',
          icon: Icons.person_outline_rounded,
        ),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;
  final void Function(String?) onSaved;
  final String? Function(String?) validator;

  const PasswordField({
    super.key,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
    required this.onSaved,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return _GlassField(
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: _buildDecoration(
          labelText: 'Password',
          hintText: 'Masukkan Password',
          icon: Icons.lock_outline_rounded,
          suffixIcon: IconButton(
            onPressed: onToggleVisibility,
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        ),
        obscureText: !isPasswordVisible,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}

class _GlassField extends StatelessWidget {
  final Widget child;

  const _GlassField({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: child,
        ),
      ),
    );
  }
}

InputDecoration _buildDecoration({
  required String labelText,
  required String hintText,
  required IconData icon,
  Widget? suffixIcon,
}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide.none,
  );

  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    labelStyle: const TextStyle(color: Colors.white),
    hintStyle: const TextStyle(color: Colors.white70),
    prefixIcon: Icon(icon, color: Colors.white),
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
    border: border,
    enabledBorder: border,
    focusedBorder: border.copyWith(
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
    errorBorder: border.copyWith(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
    ),
    focusedErrorBorder: border.copyWith(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
    ),
  );
}
