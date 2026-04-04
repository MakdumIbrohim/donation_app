import 'package:flutter/material.dart';
import 'package:donation_app/constant/app_colors.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 340,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xFF12372A),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Masuk untuk melanjutkan kebaikan hari ini.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login: $_username / $_password')),
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
                child: const Text('Masuk'),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Lupa password?'),
              ),
            ),
          ],
        ),
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
    return TextFormField(
      decoration: _buildDecoration(
        labelText: 'Username',
        hintText: 'Masukkan Username',
        icon: Icons.person_outline_rounded,
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}

class PasswordField extends StatelessWidget {
  final void Function(String?) onSaved;
  final String? Function(String?) validator;

  const PasswordField({
    super.key,
    required this.onSaved,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: _buildDecoration(
        labelText: 'Password',
        hintText: 'Masukkan Password',
        icon: Icons.lock_outline_rounded,
      ),
      obscureText: true,
      onSaved: onSaved,
      validator: validator,
    );
  }
}

InputDecoration _buildDecoration({
  required String labelText,
  required String hintText,
  required IconData icon,
}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide.none,
  );

  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    prefixIcon: Icon(icon, color: const Color(0xFF4F6F52)),
    filled: true,
    fillColor: const Color(0xFFF4FBF9),
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
