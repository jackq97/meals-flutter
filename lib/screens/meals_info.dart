import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_provider.dart';

class MealInfoScreen extends ConsumerWidget {
  const MealInfoScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var isMealInFavorite = false;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: () {
              ref
                .read(favoriteMealProvided.notifier)
                .toggleMealFavoriteStatus(meal);
          },
              icon: const Icon(Icons.star_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14,),
            Text("Ingredients: ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 14),
            for(final ingredients in meal.ingredients)
              Text(ingredients,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(height: 14),
            Text("Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold
              ),
            ),
            for(final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8
                ),
                child: Text(steps,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
              ),
            const SizedBox(height: 14),
          ],
        ),
      )
    );
  }
}