import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum MoneyType {
  gold("gold", "res/icons/coin_04d.png"),
  diamond("diamond", "res/icons/crystal_01e.png");

  const MoneyType(this.name, this.assetName);
  final String name;
  final String assetName;
}

class Price {
  final int amount;
  final MoneyType moneyType;
  const Price(this.amount, this.moneyType);
}

class StoreViewState extends State<StoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        const MoneyCard(),
        Expanded(
            child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: List.generate(
              15,
              (index) => const Equipment(
                    name: 'sword',
                    description: 'this is a sword',
                    price: Price(100, MoneyType.gold),
                    assetName: 'res/icons/sword_01c.png',
                  )),
        ))
      ],
    ));
  }
}

class StoreView extends StatefulWidget {
  const StoreView({super.key});
  @override
  StoreViewState createState() => StoreViewState();
}

class MoneyCard extends StatelessWidget {
  const MoneyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: const Row(
          children: [
            Expanded(
                child: Image(
              image: AssetImage('res/icons/liferpg.png'),
              // width: 50,
              // height: 50,
            )),
            Spacer(),
            Expanded(
                child: Column(
              children: <Widget>[
                MoneyDetail(moneyType: MoneyType.gold),
                SizedBox(height: 10),
                MoneyDetail(moneyType: MoneyType.diamond),
              ],
            )),
          ],
        ));
  }
}

class MoneyDetailState extends State<MoneyDetail> {
  final int money = 100;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(widget.moneyType.assetName),
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 10),
        Text(
          money.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}

class MoneyDetail extends StatefulWidget {
  const MoneyDetail({super.key, required this.moneyType});
  final MoneyType moneyType;
  @override
  MoneyDetailState createState() => MoneyDetailState();
}

class Equipment extends StatelessWidget {
  final String name;
  final String description;
  final Price price;
  final String assetName;
  const Equipment({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.assetName,
  });
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
                    image: AssetImage(price.moneyType.assetName),
                    width: 20,
                    height: 20,
                  ),
                  Text(price.amount.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center),
                ],
              ),
            ],
          )),
    );
  }
}
