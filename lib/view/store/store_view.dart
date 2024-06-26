import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/challenge/challenge_model.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/model/store/equipment_model.dart';
import 'package:liferpg/model/store/item_model.dart';
import 'package:liferpg/viewmodel/store_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../model/store/property_model.dart';

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
      await viewModel.loadItems();
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
                          .map((equipment) => CommodityView(
                                title: equipment.equipmentType.name(context),
                                iconPath: equipment.equipmentType.iconPath,
                                description: equipment.equipmentType
                                    .description(context),
                                price: equipment.price,
                                moneyType: equipment.moneyType,
                                stock: equipment.stock,
                                attackPower:
                                    equipment.equipmentType.attackPower,
                                defensePower:
                                    equipment.equipmentType.defensePower,
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
                    title: AppLocalizations.of(context)!.instanceDungeon,
                    initiallyExpanded: true,
                    children: viewModel.challenges
                        .map((challenge) => Challenge(
                              challenge: challenge,
                              affordable: challenge.price <=
                                  viewModel.properties
                                      .firstWhere(
                                          (property) =>
                                              property.moneyType ==
                                              MoneyType.gold,
                                          orElse: () => PropertyModel(
                                                id: 0,
                                                moneyType: MoneyType.gold,
                                                amount: 0,
                                              ))
                                      .amount,
                              buy: () async {
                                await viewModel.buyChallenge(challenge);
                              },
                            ))
                        .toList(),
                  ),
                  CustomExpansionTile(
                      title: AppLocalizations.of(context)!.items,
                      initiallyExpanded: true,
                      children: [
                        ...viewModel.items.map((item) => CommodityView(
                              title:
                                  item.name ?? item.type?.name(context) ?? "",
                              iconPath: item.iconPath,
                              description: item.description ??
                                  item.type?.description(context) ??
                                  "",
                              price: item.price,
                              moneyType: item.moneyType,
                              stock: item.stock,
                              // attackPower: item.attackPower,
                              // defensePower: item.defensePower,
                              affordable: item.price <=
                                      viewModel.properties
                                          .firstWhere(
                                              (property) =>
                                                  property.moneyType ==
                                                  item.moneyType,
                                              orElse: () => PropertyModel(
                                                    id: 0,
                                                    moneyType: item.moneyType,
                                                    amount: 0,
                                                  ))
                                          .amount &&
                                  item.stock > 0,
                              buy: () async {
                                // await viewModel.buy(equipment);
                              },
                              remove: item.isCustomized
                                  ? () async {
                                      await viewModel.deleteItem(item);
                                    }
                                  : null,
                            )),
                        AddItem(add: (CustomizedItemInfo info) {
                          viewModel.addCustomizedItem(info.name,
                              info.description, info.price, info.iconPath);
                        }),
                      ])
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

class Challenge extends StatelessWidget {
  final StoreChallengeModel challenge;
  final bool affordable;
  final Function? buy;

  const Challenge(
      {super.key, required this.challenge, this.affordable = false, this.buy});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    getChallengeLocalizedString(context, challenge).name,
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage(challenge.imageInStorePath),
                        width: 60,
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconWithText(
                              iconPath: MoneyType.gold.iconPath,
                              text: challenge.price.toString())
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 150,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            getChallengeLocalizedString(context, challenge)
                                .description,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          IconWithText(
                            iconPath: hpIconPath,
                            text: " ${challenge.totalHp}",
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconWithText(
                                iconPath: attackPowerIconPath,
                                text: " ${challenge.attack}",
                              ),
                              const SizedBox(width: 30), // 添加间距仅在attackPower非零时
                              IconWithText(
                                iconPath: defensePowerIconPath,
                                text: " ${challenge.defense}",
                              ),
                            ],
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
                image: AssetImage(challenge.imageInStorePath),
                width: 30,
                height: 30,
              ),
              Text(getChallengeLocalizedString(context, challenge).name,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center),
              IconWithText(
                  iconPath: MoneyType.gold.iconPath,
                  text: challenge.price.toString())
            ],
          )),
    );
  }
}

class CustomizedItemInfo {
  final String name;
  final String description;
  final String iconPath;
  final int price;

  CustomizedItemInfo({
    required this.name,
    required this.description,
    required this.iconPath,
    required this.price,
  });
}

// extension CustomizedItemInfoExtension on CustomizedItemInfo {
//   CustomizedItemTableCompanion toCompanion() {
//     return CustomizedItemTableCompanion(
//       name: Value(name),
//       description: Value(description),
//       price: Value(price),
//     );
//   }
// }

class AddItem extends StatefulWidget {
  const AddItem({super.key, this.add});

  final Function(CustomizedItemInfo)? add;

  @override
  AddItemState createState() => AddItemState();
}

class AddItemState extends State<AddItem> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  String getRandomIconPath() {
    final List<String> iconPaths = [
      'res/icons/kyrise/gift_01a.png',
      'res/icons/kyrise/gift_01b.png',
      'res/icons/kyrise/gift_01c.png',
      'res/icons/kyrise/gift_01d.png',
      'res/icons/kyrise/gift_01e.png',
      'res/icons/kyrise/gift_01f.png'
    ];
    final random = Random();
    int index = random.nextInt(iconPaths.length);
    return iconPaths[index];
  }

  @override
  Widget build(BuildContext context) {
    final iconPath = getRandomIconPath();
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    AppLocalizations.of(context)!.addItem,
                    textAlign: TextAlign.center,
                  ),
                  content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage(iconPath),
                            width: 60,
                            height: 60,
                          ),
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                                icon: Image(
                                  image:
                                      const AssetImage('res/icons/title.png'),
                                  width: Theme.of(context).iconTheme.size,
                                  height: Theme.of(context).iconTheme.size,
                                ),
                                labelText: AppLocalizations.of(context)!.name),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .titleRequired;
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                                icon: Image(
                                  image: const AssetImage(
                                      'res/icons/description.png'),
                                  width: Theme.of(context).iconTheme.size,
                                  height: Theme.of(context).iconTheme.size,
                                ),
                                labelText:
                                    AppLocalizations.of(context)!.description),
                          ),
                          TextFormField(
                            controller: _priceController,
                            decoration: InputDecoration(
                                icon: Image(
                                  image: AssetImage(MoneyType.gold.iconPath),
                                  width: Theme.of(context).iconTheme.size,
                                  height: Theme.of(context).iconTheme.size,
                                ),
                                labelText: AppLocalizations.of(context)!.price),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .priceRequired;
                              }
                              if (int.tryParse(value) == null) {
                                return AppLocalizations.of(context)!
                                    .priceInvalid;
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // clear current state
                            _titleController.clear();
                            _descriptionController.clear();
                            _priceController.clear();
                            Navigator.of(context).pop();
                          },
                          child: Text(AppLocalizations.of(context)!.cancel),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // clear current state
                              final newItem = CustomizedItemInfo(
                                name: _titleController.text,
                                description: _descriptionController.text,
                                iconPath: iconPath,
                                price: int.parse(_priceController.text),
                              );
                              widget.add?.call(newItem);
                              _titleController.clear();
                              _descriptionController.clear();
                              _priceController.clear();

                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(AppLocalizations.of(context)!.add),
                        ),
                      ],
                    )
                  ],
                ));
      },
      child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.add,
                size: 30,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text(AppLocalizations.of(context)!.addItem,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center),
            ],
          )),
    );
  }
}

class CommodityView extends StatelessWidget {
  final String title;
  final String? iconPath;
  final String description;
  final MoneyType moneyType;
  final int price;
  final int stock;
  final bool affordable;
  final Function? buy;
  final int attackPower;
  final int defensePower;
  final Function? remove;

  const CommodityView({
    super.key,
    required this.title,
    this.iconPath,
    required this.description,
    required this.price,
    this.moneyType = MoneyType.gold,
    this.stock = 100,
    this.affordable = false,
    this.buy,
    this.attackPower = 0,
    this.defensePower = 0,
    this.remove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => {
        if (remove != null)
          {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        AppLocalizations.of(context)!.removeItem,
                        textAlign: TextAlign.center,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage(iconPath!),
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
                            description,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (attackPower != 0)
                                IconWithText(
                                  iconPath: attackPowerIconPath,
                                  text: " +$attackPower",
                                ),
                              if (attackPower != 0 && defensePower != 0)
                                const SizedBox(
                                    width: 30), // 添加间距仅在attackPower非零时
                              if (defensePower != 0)
                                IconWithText(
                                  iconPath: defensePowerIconPath,
                                  text: " +$defensePower",
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
                              onPressed: () {
                                remove?.call();
                                // show snack bar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(AppLocalizations.of(context)!
                                        .removeSuccess),
                                    duration: const Duration(seconds: 1),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                );
                                Navigator.of(context).pop();
                              },
                              child: Text(AppLocalizations.of(context)!.remove),
                            ),
                          ],
                        )
                      ],
                    ))
          }
      },
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      iconPath == null
                          ? const SizedBox()
                          : Image(
                              image: AssetImage(iconPath!),
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
                        description,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (attackPower != 0)
                            IconWithText(
                              iconPath: attackPowerIconPath,
                              text: " +$attackPower",
                            ),
                          if (attackPower != 0 && defensePower != 0)
                            const SizedBox(width: 30), // 添加间距仅在attackPower非零时
                          if (defensePower != 0)
                            IconWithText(
                              iconPath: defensePowerIconPath,
                              text: " +$defensePower",
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
              iconPath == null
                  ? const SizedBox()
                  : Image(
                      image: AssetImage(iconPath!),
                      width: 30,
                      height: 30,
                    ),
              Text(title,
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
