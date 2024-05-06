import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen>{

  var _glutenFreeFiltersSet = false;
  var _lactoseFreeFiltersSet = false;
  var _vegetarianFreeFiltersSet = false;
  var _veganFreeFiltersSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFiltersSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFiltersSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFreeFiltersSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFreeFiltersSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      drawer: MainDrawer(onSelectScreen: (identifier) {
        Navigator.of(context).pop();
        if (identifier == "meals") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const TabsScreen())
          );
        }
      }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFiltersSet,
            Filter.lactoseFree: _lactoseFreeFiltersSet,
            Filter.vegetarian: _vegetarianFreeFiltersSet,
            Filter.vegan: _veganFreeFiltersSet,
          });
          return false;
        },
        child: Column(
          children: [

            SwitchListTile(value: _glutenFreeFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFiltersSet = isChecked;
                });
              },
              title: Text("Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                   color:  Theme.of(context).colorScheme.onBackground)
              ),
              subtitle: Text("Only include gluten-free meals.",
                style:Theme.of(context).textTheme.labelMedium!.copyWith(
                    color:  Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(value: _lactoseFreeFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFiltersSet = isChecked;
                });
              },
              title: Text("Lactose-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color:  Theme.of(context).colorScheme.onBackground)
              ),
              subtitle: Text("Only include Lactose-free meals.",
                style:Theme.of(context).textTheme.labelMedium!.copyWith(
                    color:  Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(value: _vegetarianFreeFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFiltersSet = isChecked;
                });
              },
              title: Text("Vegetarian",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color:  Theme.of(context).colorScheme.onBackground)
              ),
              subtitle: Text("Only include vegetarian meals.",
                style:Theme.of(context).textTheme.labelMedium!.copyWith(
                    color:  Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(value: _veganFreeFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFiltersSet = isChecked;
                });
              },
              title: Text("Vegan",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color:  Theme.of(context).colorScheme.onBackground)
              ),
              subtitle: Text("Only include Vegan meals.",
                style:Theme.of(context).textTheme.labelMedium!.copyWith(
                    color:  Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}