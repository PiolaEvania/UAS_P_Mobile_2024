import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/auth/auth_service.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isInputValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  void _resetPassword(BuildContext context) async {
    if (!_isInputValid()) {
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);
    final username = _usernameController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    try {
      await authService.resetPassword(username, newPassword, confirmPassword);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password reset successfully')));
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    style: TextStyle(fontWeight: FontWeight.normal),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _newPasswordController,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                    ),
                    style: TextStyle(fontWeight: FontWeight.normal),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'New password is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirm New Password',
                    ),
                    style: TextStyle(fontWeight: FontWeight.normal),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm new password is required';
                      }
                      if (value != _newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () => _resetPassword(context),
                    child: Text('Reset Password'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
