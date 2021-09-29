import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  Container _createSectionTitle({
    required BuildContext context,
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Container _createSectionContainer({
    required Meal meal,
    required BuildContext context,
    required ListView child,
  }) {
    return Container(
      width: 350,
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _createSectionTitle(
                context: context,
                title: 'Ingredientes',
              ),
              _createSectionContainer(
                meal: meal,
                context: context,
                child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    final ingredient = meal.ingredients[index];
        
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(ingredient),
                      ),
                      color: Theme.of(context).colorScheme.secondary,
                    );
                  },
                ),
              ),
              _createSectionTitle(
                context: context,
                title: 'Passos',
              ),
              _createSectionContainer(
                meal: meal,
                context: context,
                child: ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (ctx, index) {
                    final step = meal.steps[index];
        
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white,
                          ),
                          title: Text(step),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
