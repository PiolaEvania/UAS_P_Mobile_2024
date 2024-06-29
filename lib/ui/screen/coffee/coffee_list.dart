import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/coffee_state.dart';
import 'coffee_detail.dart';

class CoffeeListScreen extends StatefulWidget {
  @override
  _CoffeeListScreenState createState() => _CoffeeListScreenState();
}

class _CoffeeListScreenState extends State<CoffeeListScreen> {
  int _selectedIndex = 0;
  bool _isAscending = true;

  @override
  void initState() {
    super.initState();
    Provider.of<CoffeeState>(context, listen: false).fetchCoffees().then((_) {
      Provider.of<CoffeeState>(context, listen: false).sortCoffees(_isAscending);
    });
  }

  void _toggleSortOrder() {
    _isAscending = !_isAscending;
    Provider.of<CoffeeState>(context, listen: false).sortCoffees(_isAscending);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushNamed(context, '/profile').then((_) {
          setState(() {
            _selectedIndex = 0;
          });
        });
        break;
    }
  }

  void _toggleTheme(BuildContext context) {
    Provider.of<CoffeeState>(context, listen: false).switchTheme(context);
  }

  @override
  Widget build(BuildContext context) {
    final coffeeState = Provider.of<CoffeeState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee List'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: _toggleSortOrder,
          ),
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () => _toggleTheme(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      coffeeState.filterCoffees(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search Coffee...',
                      prefixIcon: Icon(Icons.search),
                    ),
                    style: TextStyle(fontWeight: FontWeight.normal),
                    cursorColor: Color(0xFF4E342E),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: coffeeState.filteredCoffees.length,
              itemBuilder: (context, index) {
                final coffee = coffeeState.filteredCoffees[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoffeeDetailScreen(coffee: coffee),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              coffee.image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Text(
                              coffee.title,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        onTap: _onItemTapped,
      ),
    );
  }
}
