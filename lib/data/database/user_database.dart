import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// Menyimpan dan mengelola data pengguna dengan SharedPreferences
class UserDatabase {
  // Method addUser untuk menambahkan data user saat register dengan mengubah data menjadi object JSON
  static Future<void> addUser(String username, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');
    final users = usersJson == null ? {} : jsonDecode(usersJson) as Map<String, dynamic>;

    users[username] = {
      'username': username,
      'email': email,
      'password': password,
    };

    await prefs.setString('users', jsonEncode(users));
  }

  // Method userExist untuk mengecek data user sudah terdaftar (dipakai di register)
  static Future<bool> userExists(String username, String email) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');

    if (usersJson == null) {
      return false;
    } else {
      final users = jsonDecode(usersJson) as Map<String, dynamic>;

      for (var user in users.values) {
        if (user['username'] == username || user['email'] == email) {
          return true;
        }
      }
      return false;
    }
  }

  // Method getUser untuk mendapatkan data user (dipakai untuk mengecek keberadaan data user)
  static Future<Map<String, dynamic>?> getUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');
    if (usersJson == null) {
      return null;
    } else {
      final users = jsonDecode(usersJson);
      return users[username];
    }
  }

  // Method resetPassword untuk mengecek data user untuk keperluan lupa/ganti password
  static Future<void> resetPassword(String username, String newPassword) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');
    if (usersJson != null) {
      final users = jsonDecode(usersJson) as Map<String, dynamic>;
      if (users.containsKey(username)) {
        users[username]['password'] = newPassword;
        await prefs.setString('users', jsonEncode(users));
      } else {
        throw Exception('User not found');
      }
    } else {
      throw Exception('No users registered');
    }
  }

  // Method deleteUser untuk menghapus data user dari database
  static Future<void> deleteUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');
    if (usersJson != null) {
      final users = jsonDecode(usersJson) as Map<String, dynamic>;
      if (users.containsKey(username)) {
        users.remove(username);
        await prefs.setString('users', jsonEncode(users));
      } else {
        throw Exception('User not found');
      }
    } else {
      throw Exception('No users registered');
    }
  }
}
