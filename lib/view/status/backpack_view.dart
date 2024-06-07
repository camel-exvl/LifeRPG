import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/viewmodel/status_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:liferpg/view/status/dialog/weapon_dialog.dart';
import 'package:liferpg/view/status/dialog/armor_dialog.dart';

class BackpackView extends StatefulWidget {
  const BackpackView({super.key});

  @override
  State<BackpackView> createState() => _BackpackView();
}

class _BackpackView extends State<BackpackView> {
  final viewModel = StatusViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<StatusViewModel>(builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.backpack),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            AppLocalizations.of(context)!.weapon,
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 250, // or any other height
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            itemCount: viewModel.getWeaponIds().length,
                            itemBuilder: (context, index) {
                              return WeaponCard(
                                  itemId: viewModel.getWeaponIds()[index],
                                  itemIndex: index,
                                  isEquipped:
                                      viewModel.status.weaponIndex == index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          AppLocalizations.of(context)!.armor,
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 250, // or any other height
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemCount: viewModel.getArmorIds().length,
                          itemBuilder: (context, index) {
                            return ArmorCard(
                                itemId: viewModel.getArmorIds()[index],
                                itemIndex: index,
                                isEquipped:
                                    viewModel.status.armorIndex == index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}

class WeaponCard extends StatelessWidget {
  final int itemId;
  final int itemIndex;
  final bool isEquipped;

  const WeaponCard(
      {super.key,
      required this.itemId,
      required this.itemIndex,
      required this.isEquipped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WeaponDialog(weaponIndex: itemIndex, isEquipped: isEquipped)
            .show(context);
      },
      child: Card(
        child: Container(
          color: isEquipped
              ? Theme.of(context).colorScheme.secondaryContainer
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Image.asset('res/icons/liferpg.png'),
              ),
              Expanded(
                flex: 1,
                child: Text('Index $itemIndex'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArmorCard extends StatelessWidget {
  final int itemId;
  final int itemIndex;
  final bool isEquipped;

  const ArmorCard(
      {super.key,
      required this.itemId,
      required this.itemIndex,
      required this.isEquipped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ArmorDialog(armorIndex: itemIndex, isEquipped: isEquipped)
            .show(context);
      },
      child: Card(
        child: Container(
          color: isEquipped
              ? Theme.of(context).colorScheme.secondaryContainer
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Image.asset('res/icons/liferpg.png'),
              ),
              Expanded(
                flex: 1,
                child: Text('Index $itemIndex'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
