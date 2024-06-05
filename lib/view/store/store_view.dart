import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/viewmodel/store_viewmodel.dart';
import 'package:provider/provider.dart';

class StoreViewState extends State<StoreView>
    with AutomaticKeepAliveClientMixin {
  final viewModel = StoreViewModel();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<StoreViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: <Widget>[
              MoneyContainer(properties: viewModel.properties),
              Expanded(
                  child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: viewModel.storeItems
                    .map((storeItem) => Equipment(
                          item: storeItem,
                        ))
                    .toList(),
                // List.generate(
                //     15,
                //     (index) => const Equipment(
                //           name: 'sword',
                //           description: 'this is a sword',
                //           price: Price(100, MoneyType.gold),
                //           assetName: 'res/icons/kyrise/sword_01c.png',
                //         )),
              ))
            ],
          );
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
          children: [
            const Expanded(
                child: Image(
              image: AssetImage('res/icons/liferpg.png'),
              // width: 50,
              // height: 50,
            )),
            const Spacer(),
            Expanded(
                child: Column(
              children: properties
                  .map((property) => MoneyDetail(property: property))
                  .toList(),
              //     List.generate(properties.length * 2 - 1, (index) {
              //   if (index.isEven) {
              //     return MoneyDetail(property: properties[index ~/ 2]);
              //   } else {
              //     return const SizedBox(height: 10);
              //   }
              // }),
            )),
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
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 10),
        Text(
          widget.property.amount.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
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
  final String name;
  final String assetName;
  final String description;
  final MoneyType moneyType;
  final int price;
  final int stock;

  Equipment({super.key, required StoreModel item})
      : name = item.name,
        assetName = item.assetName,
        description = item.description,
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
                  title: Text(name),
                  content: Text(description),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ));
      },
      child: Container(
          padding: const EdgeInsets.all(8),
          // decoration: BoxDecoration(
          //   color: Theme.of(context).colorScheme.secondary,
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage(assetName),
                width: 30,
                height: 30,
              ),
              Text(name,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(moneyType.iconPath),
                    width: 20,
                    height: 20,
                  ),
                  Text(price.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center),
                ],
              ),
            ],
          )),
    );
  }
}
