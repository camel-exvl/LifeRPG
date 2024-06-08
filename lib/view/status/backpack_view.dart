import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/viewmodel/status_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:liferpg/view/status/dialog/weapon_dialog.dart';
import 'package:liferpg/view/status/dialog/armor_dialog.dart';

import '../../database/database.dart';
import '../../model/store/equipment_model.dart';

class BackpackView extends StatefulWidget {
  const BackpackView({super.key});

  @override
  State<BackpackView> createState() => _BackpackView();
}

class _BackpackView extends State<BackpackView> {
  final viewModel = StatusViewModel();

  @override void initState() {
    super.initState();
    viewModel.loadWeaponList();
    viewModel.loadArmorList();
  }

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
                        LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            // 获取每行的高度
                            double rowHeight = 100;
                            // 计算行数
                            int rowCount = (viewModel.getWeaponIds().length / 4).ceil();
                            // 如果行数大于2，限制为2行的高度，否则为实际行数的高度
                            double gridViewHeight = rowCount > 2 ? rowHeight * 2 : rowHeight * rowCount;

                            return SizedBox(
                              height: gridViewHeight,
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                ),
                                itemCount: viewModel.weapons.length,
                                itemBuilder: (context, index) {
                                  return WeaponCard(
                                    equipment: viewModel.weapons[index],
                                    itemIndex: index,
                                    isEquipped: viewModel.status.weaponIndex == index,
                                  );
                                },
                              ),
                            );
                          },
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
                      LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          // 获取每行的高度
                          double rowHeight = 100;
                          // 计算行数
                          int rowCount = (viewModel.getArmorIds().length / 4).ceil();
                          // 如果行数大于2，限制为2行的高度，否则为实际行数的高度
                          double gridViewHeight = rowCount > 2 ? rowHeight * 2 : rowHeight * rowCount;

                          return SizedBox(
                            height: gridViewHeight,
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemCount: viewModel.armors.length,
                              itemBuilder: (context, index) {
                                return ArmorCard(
                                  equipment: viewModel.armors[index],
                                  itemIndex: index,
                                  isEquipped: viewModel.status.armorIndex == index,
                                );
                              },
                            ),
                          );
                        },
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
  final EquipmentModel equipment;
  final int itemIndex;
  final bool isEquipped;

  const WeaponCard(
      {super.key,
      required this.equipment,
      required this.itemIndex,
      required this.isEquipped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WeaponDialog(equipment: equipment, weaponIndex: itemIndex, isEquipped: isEquipped)
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
                flex: 1,
                child: Container()
              ),
              Expanded(
                flex: 6,
                child: Image.asset(equipment.equipmentType.iconPath),
              ),
              Expanded(
                flex: 4,
                child: Text(equipment.equipmentType.name(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArmorCard extends StatelessWidget {
  final EquipmentModel equipment;
  final int itemIndex;
  final bool isEquipped;

  const ArmorCard(
      {super.key,
      required this.equipment,
      required this.itemIndex,
      required this.isEquipped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ArmorDialog(equipment: equipment, armorIndex: itemIndex, isEquipped: isEquipped)
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
                child: Image.asset(equipment.equipmentType.iconPath),
              ),
              Expanded(
                flex: 1,
                child: Text(equipment.equipmentType.name(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
