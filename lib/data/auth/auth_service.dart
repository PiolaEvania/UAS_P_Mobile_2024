import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/user_database.dart';

//Mengelola proses otentikasi user dengan SharedPreferences dan memeriksa data user di class UserDatabase
class AuthService with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _username;
  String? _email;

  bool get isAuthenticated => _isAuthenticated;
  String? get username => _username;
  String? get email => _email;

  //Menghandle proses login
  Future<void> login(String username, String password) async {
    final user = await UserDatabase.getUser(username);
    if (user != null && user['password'] == password) {
      _username = username;
      _email = user['email'];
      _isAuthenticated = true;
      await _saveUserCredentials();
      notifyListeners();
    } else {
      throw Exception('Invalid username or password');
    }
  }

  //Menghandle proses register, dan menyimpan data user ke database dengan method addUser
  Future<void> register(String username, String email, String password) async {
    final existingUser = await UserDatabase.userExists(username, email);
    if (existingUser) {
      throw Exception('Username or email already exists');
    }
    await UserDatabase.addUser(username, email, password);
    _username = username;
    _email = email;
    _isAuthenticated = true;
    await _saveUserCredentials();
    notifyListeners();
  }

  //Menghandle proses logout
  Future<void> logout() async {
    _username = null;
    _email = null;
    _isAuthenticated = false;
    await _clearUserCredentials();
    notifyListeners();
  }

  //Mengecek status login untuk state aplikasi (setelah user login dan keluar aplikasi, user akan tetap login)
  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('username')) {
      _username = prefs.getString('username');
      _email = prefs.getString('email');
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  //Menyimpan data user untuk verifikasi user (dipakai saat login dan register)
  Future<void> _saveUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _username!);
    await prefs.setString('email', _email!);
  }

  //Menghapus data user untuk verifikasi user (dipakai saat logout)
  Future<void> _clearUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('email');
  }

  //Mereset password dengan method resetPassword yang mengecek data user di dalam database
  Future<void> resetPassword(String username, String newPassword, String confirmPassword) async {
    if (newPassword != confirmPassword) {
      throw Exception('Passwords do not match');
    }
    await UserDatabase.resetPassword(username, newPassword);
  }

  //Mengganti password dengan method resetPassword yang mengecek data user yaitu password sebelumnya di database
  Future<void> changePassword(String username, String currentPassword, String newPassword, String confirmPassword) async {
    final user = await UserDatabase.getUser(username);
    if (user == null || user['password'] != currentPassword) {
      throw Exception('Current password is incorrect');
    }
    if (newPassword != confirmPassword) {
      throw Exception('Passwords do not match');
    }
    if (currentPassword == newPassword) {
      throw Exception('Cannot use the same password');
    }
    _isAuthenticated = false;
    await UserDatabase.resetPassword(username, newPassword);
  }
}
