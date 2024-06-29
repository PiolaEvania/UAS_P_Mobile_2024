import 'package:flutter/material.dart';
import '../../../domain/entity/coffee.dart';

class CoffeeDetailScreen extends StatelessWidget {
  final Coffee coffee;

  CoffeeDetailScreen({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coffee.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.network(
                      coffee.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coffee.title,
                          style: Theme.of(context).textTheme.headlineLarge
                      ),
                      SizedBox(height: 8),
                      Text(
                        coffee.description,
                          style: Theme.of(context).textTheme.headlineMedium
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Ingredients:',
                          style: Theme.of(context).textTheme.bodyLarge
                      ),
                      SizedBox(height: 8),
                      Text(
                        coffee.ingredients.join('\n'),
                          style: Theme.of(context).textTheme.bodyMedium
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
