import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/model/store/equipment_model.dart';
import 'package:liferpg/viewmodel/store_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoreViewState extends State<StoreView>
    with AutomaticKeepAliveClientMixin {
  final viewModel = StoreViewModel();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await viewModel.loadProperties();
      await viewModel.loadEquipments();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<StoreViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                title: MoneyContainer(properties: viewModel.properties),
              ),
              body: SingleChildScrollView(
                child: Column(children: <Widget>[
                  CustomExpansionTile(
                      title: AppLocalizations.of(context)!.equipments,
                      initiallyExpanded: true,
                      children: viewModel.equipments
                          .map((equipment) => Equipment(
                                item: equipment,
                                affordable: equipment.price <=
                                        viewModel.properties
                                            .firstWhere((property) =>
                                                property.moneyType ==
                                                equipment.moneyType)
                                            .amount &&
                                    equipment.stock > 0,
                                buy: () async {
                                  await viewModel.buy(equipment);
                                },
                              ))
                          .toList()),
                  CustomExpansionTile(
                      title: AppLocalizations.of(context)!.items,
                      children: const [
                        Placeholder(),
                      ]),
                  CustomExpansionTile(
                      title: AppLocalizations.of(context)!.instanceDungeon,
                      children: const [
                        Placeholder(),
                      ]),
                ]),
              ));
        },
      ),
    );
  }
}

class StoreView extends StatefulWidget {
  const StoreView({super.key});
  @override
  StoreViewState createState() => StoreViewState();
}

class MoneyContainer extends StatelessWidget {
  final UnmodifiableListView<PropertyModel> properties;
  const MoneyContainer({super.key, required this.properties});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(AppLocalizations.of(context)!.myProperty,
                style: Theme.of(context).textTheme.titleLarge),
            ...properties.map((property) => MoneyDetail(property: property))
          ],
        ));
  }
}

class MoneyDetailState extends State<MoneyDetail> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(widget.property.moneyType.iconPath),
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 10),
        Text(
          widget.property.amount.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}

class MoneyDetail extends StatefulWidget {
  const MoneyDetail({super.key, required this.property});
  final PropertyModel property;
  @override
  MoneyDetailState createState() => MoneyDetailState();
}

class Equipment extends StatelessWidget {
  final EquipmentType equipmentType;
  final MoneyType moneyType;
  final int price;
  final int stock;
  final bool affordable;
  final Function? buy;

  Equipment(
      {super.key,
      required EquipmentModel item,
      this.affordable = false,
      this.buy})
      : equipmentType = item.equipmentType,
        moneyType = item.moneyType,
        price = item.price,
        stock = item.stock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    equipmentType.name(context),
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage(equipmentType.iconPath),
                        width: 60,
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconWithText(
                              iconPath: moneyType.iconPath,
                              text: price.toString())
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        equipmentType.description(context),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (equipmentType.attackPower != 0)
                            IconWithText(
                              iconPath: equipmentType.attackPowerIconPath,
                              text: " +${equipmentType.attackPower}",
                            ),
                          if (equipmentType.attackPower != 0 &&
                              equipmentType.defensePower != 0)
                            const SizedBox(width: 30), // 添加间距仅在attackPower非零时
                          if (equipmentType.defensePower != 0)
                            IconWithText(
                              iconPath: equipmentType.defensePowerIconPath,
                              text: " +${equipmentType.defensePower}",
                            ),
                        ],
                      )
                    ],
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Implement the purchase logic here
                            // For example, you can deduct money from the user's account and update the stock
                            // Then close the dialog
                            Navigator.of(context).pop();
                          },
                          child: Text(AppLocalizations.of(context)!.cancel),
                        ),
                        TextButton(
                          onPressed: affordable
                              ? () {
                                  buy?.call();
                                  // show snack bar
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          AppLocalizations.of(context)!
                                              .purchaseSuccess),
                                      duration: const Duration(seconds: 1),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  );
                                  Navigator.of(context).pop();
                                }
                              : null,
                          child: Text(AppLocalizations.of(context)!.buy),
                        ),
                      ],
                    )
                  ],
                ));
      },
      child: Container(
          padding: const EdgeInsets.all(0),
          // decoration: BoxDecoration(
          //   color: Theme.of(context).colorScheme.secondary,
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage(equipmentType.iconPath),
                width: 30,
                height: 30,
              ),
              Text(equipmentType.name(context),
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center),
              IconWithText(iconPath: moneyType.iconPath, text: price.toString())
            ],
          )),
    );
  }
}

class IconWithText extends StatelessWidget {
  final String iconPath;
  final String text;
  const IconWithText({super.key, required this.iconPath, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool initiallyExpanded;
  const CustomExpansionTile(
      {super.key,
      required this.title,
      required this.children,
      this.initiallyExpanded = false});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(title),
        initiallyExpanded: initiallyExpanded,
        children: <Widget>[
          GridView.count(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              crossAxisCount: 3,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
              children: children)
        ]);
  }
}
