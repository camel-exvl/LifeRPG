import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/view/target/target_view.dart';
import 'package:liferpg/view/target_view.dart';
import 'package:liferpg/view/status_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _views = const <Widget>[
    TargetView(),
    Placeholder(),
    Placeholder(),
    StatusView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: IndexedStack(
        // use IndexedStack can keep the state of the widgets
        index: _selectedIndex,
        children: _views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
                image: const AssetImage('res/icons/target.png'),
                width: Theme.of(context).iconTheme.size,
                height: Theme.of(context).iconTheme.size),
            label: AppLocalizations.of(context)!.targetsTab,
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: const AssetImage('res/icons/challenge.png'),
                width: Theme.of(context).iconTheme.size,
                height: Theme.of(context).iconTheme.size),
            label: AppLocalizations.of(context)!.challengeTab,
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: const AssetImage('res/icons/shop.png'),
                width: Theme.of(context).iconTheme.size,
                height: Theme.of(context).iconTheme.size),
            label: AppLocalizations.of(context)!.shopTab,
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: const AssetImage('res/icons/status.png'),
                width: Theme.of(context).iconTheme.size,
                height: Theme.of(context).iconTheme.size),
            label: AppLocalizations.of(context)!.statusTab,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
