import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/auth/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  final String? username;

  RegisterScreen({this.username});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.username != null) {
      _usernameController.text = widget.username!;
    }
  }

  bool _isInputValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  void _register(BuildContext context) async {
    if (!_isInputValid()) {
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.register(
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
      );
      Navigator.pushReplacementNamed(context, '/list');
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
                  Text('Hey There,',
                      style: Theme.of(context).textTheme.headlineMedium
                  ),
                  Text(
                    'Create an Account',
                      style: Theme.of(context).textTheme.headlineLarge
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username'
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
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email'
                    ),
                    style: TextStyle(fontWeight: FontWeight.normal),
                    cursorColor: Color(0xFF4E342E),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password'
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
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password'
                    ),
                    style: TextStyle(fontWeight: FontWeight.normal),
                    cursorColor: Color(0xFF4E342E),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm Password is required';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => _register(context),
                    child: Text('Register')
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Already have an account? Login",
                        style: Theme.of(context).textTheme.bodyMedium
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
