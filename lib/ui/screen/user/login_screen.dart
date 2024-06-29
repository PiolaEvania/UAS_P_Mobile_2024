import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/auth/auth_service.dart';
import '../../../ui/screen/user/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isInputValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  void _login(BuildContext context) async {
    if (!_isInputValid()) {
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.login(_usernameController.text, _passwordController.text);
      if (authService.isAuthenticated) {
        Navigator.pushReplacementNamed(context, '/list');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid username or password')));
    }
  }

  void _forgotPassword(BuildContext context) {
    Navigator.pushNamed(context, '/forgot_password');
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
                    'Hey There,',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    style: TextStyle(fontWeight: FontWeight.normal),
                    cursorColor: Color(0xFF4E342E),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    style: TextStyle(fontWeight: FontWeight.normal),
                    cursorColor: Color(0xFF4E342E),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => _forgotPassword(context),
                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => _login(context),
                    child: Text('Login'),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
                    },
                    child: Text(
                      "Don't have an account? Register",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
