import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function(Map<String, bool>) selectFilter;
  final Map<String, bool> currentlyFilters;
  const FiltersScreen(
      {Key? key, required this.selectFilter, required this.currentlyFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  Widget _buildSwitchListTitle(
      String title, String subTitle, bool isSth, Function(bool) state) {
    return SwitchListTile(
      value: isSth,
      onChanged: state,
      title: Text(title),
      subtitle: Text(
        subTitle,
        style: const TextStyle(color: Colors.black54),
      ),
      activeTrackColor: Theme.of(context).primaryColor,
      activeColor: Colors.orange[600],
    );
  }

  @override
  void initState() {
    super.initState();
    isGlutenFree = widget.currentlyFilters['gluten'] as bool;
    isVegan = widget.currentlyFilters['vegan'] as bool;
    isVegetarian = widget.currentlyFilters['vegetarian'] as bool;
    isLactoseFree = widget.currentlyFilters['lactose'] as bool;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Adjust your meals selection.',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTitle('GLuten-Free',
                    'Only include gluten-free meals', isGlutenFree, (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Vegan', 'Only include vegan meals', isVegan, (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Vegetarian', 'Only include vegetarian meals', isVegetarian,
                    (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                }),
                _buildSwitchListTitle(
                  'Lactose-Free',
                  'Only include lactose-free meals',
                  isLactoseFree,
                  (newValue) {
                    setState(() {
                      isLactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'flb1',
        onPressed: () {
          widget.selectFilter({
            'gluten': isGlutenFree,
            'vegan': isVegan,
            'vegetarian': isVegetarian,
            'lactose': isLactoseFree,
          });
          Navigator.of(context).pushReplacementNamed('/');
        },
        child: const Icon(Icons.save),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
