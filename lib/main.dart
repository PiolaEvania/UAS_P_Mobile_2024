import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/auth/auth_service.dart';
import 'data/datasource/coffee_remote_data_source_impl.dart';
import 'data/repository/coffee_repository_impl.dart';
import 'domain/usecase/get_coffees.dart';
import 'theme.dart';
import 'ui/screen/coffee/coffee_list_screen.dart';
import 'ui/screen/user/change_password_screen.dart';
import 'ui/screen/user/forgot_password_screen.dart';
import 'ui/screen/user/login_screen.dart';
import 'ui/screen/user/profile_screen.dart';
import 'ui/screen/user/register_screen.dart';
import 'ui/state/coffee_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final coffeeRepository = CoffeeRepositoryImpl(
    remoteDataSource: CoffeeRemoteDataSourceImpl(),
  );
  final getCoffees = GetCoffees(coffeeRepository);
  final prefs = await SharedPreferences.getInstance();

  //Mengelola state menggunakan Provider, Coffee dari CoffeeState dan User dari AuthService
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoffeeState(getCoffees: getCoffees)),
        ChangeNotifierProvider(create: (_) => AuthService()..checkLoginStatus()),
      ],
      child: CoffeeApp(),
    ),
  );
}

//Menghandle theme dan route
class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeState>(
      builder: (context, coffeeState, _) {
        return MaterialApp(
          title: 'Coffee',
          themeMode: ThemeMode.light,
          theme: coffeeState.currentTheme,
          darkTheme: darkCoffeeTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => Consumer<AuthService>(
              builder: (context, authService, _) {
                return authService.isAuthenticated ? CoffeeListScreen() : LoginScreen();
              },
            ),
            '/register': (context) => RegisterScreen(),
            '/list': (context) => Consumer<AuthService>(
              builder: (context, authService, _) {
                return authService.isAuthenticated ? CoffeeListScreen() : LoginScreen();
              },
            ),
            '/profile': (context) => ProfileScreen(),
            '/forgot_password': (context) => ForgotPasswordScreen(),
            '/change_password': (context) => ChangePasswordScreen(),
          },
        );
      },
    );
  }
}
