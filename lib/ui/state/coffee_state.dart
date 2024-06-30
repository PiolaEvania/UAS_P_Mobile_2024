import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entity/coffee.dart';
import '../../domain/usecase/get_coffees.dart';
import '../../theme.dart';


//Mengelola state
class CoffeeState with ChangeNotifier {
  final GetCoffees getCoffees;
  List<Coffee> _coffees = [];
  List<Coffee> _filteredCoffees = [];
  bool _isAscending = true;
  ThemeData _currentTheme = lightCoffeeTheme;

  CoffeeState({required this.getCoffees}) {
    _initializeTheme();
  }

  List<Coffee> get coffees => _coffees;
  List<Coffee> get filteredCoffees => _filteredCoffees;
  ThemeData get currentTheme => _currentTheme;
  bool get isAscending => _isAscending;

  //Mengambil data kopi
  Future<void> fetchCoffees() async {
    _coffees = await getCoffees();
    _filteredCoffees = _coffees;
    notifyListeners();
  }

  //Mencari data kopi
  void filterCoffees(String query) {
    if (query.isEmpty) {
      _filteredCoffees = _coffees;
    } else {
      _filteredCoffees = _coffees.where((coffee) {
        return coffee.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  //Mengurutkan list A-Z/Z-A
  void sortCoffees(bool ascending) {
    _isAscending = ascending;
    _filteredCoffees.sort((a, b) => _isAscending ? a.title.compareTo(b.title) : b.title.compareTo(a.title));
    notifyListeners();
  }

  //Mengganti tema light/dark
  void switchTheme(BuildContext context) {
    _currentTheme = _currentTheme == lightCoffeeTheme ? darkCoffeeTheme : lightCoffeeTheme;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isDarkMode', _currentTheme == darkCoffeeTheme);
    });
    notifyListeners();
  }

  void _initializeTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _currentTheme = isDarkMode ? darkCoffeeTheme : lightCoffeeTheme;
    notifyListeners();
  }
}
