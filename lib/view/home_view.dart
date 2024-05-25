import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/view/target_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  // TODO: Replace this with actual pages
  static const List<Widget> _widgetOptions = <Widget>[
    TargetView(),
    Placeholder(),
    Placeholder(),
    Placeholder()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: AppLocalizations.of(context)!.targetsTab,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.emoji_events),
            label: AppLocalizations.of(context)!.challengeTab,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: AppLocalizations.of(context)!.shopTab,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.check_circle),
            label: AppLocalizations.of(context)!.statusTab,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
