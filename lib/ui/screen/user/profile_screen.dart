import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/auth/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                alignment: Alignment.center,
                width: screenSize.width,
                height: screenSize.height / 1.17,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hi!',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '${authService.username}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${authService.email}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/change_password');
                        },
                        child: Text('Change Password'),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          authService.logout();
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}