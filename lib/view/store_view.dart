import 'package:flutter/material.dart';

class StoreViewState extends State<StoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: const Text("He'd have you all unravel at the"),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: const Text('Heed not the rabble'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('Sound of screams but the'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Text('Who scream'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: const Text('Revolution is coming...'),
            ),
          ],
        )
      ],
    ));
  }
}

class StoreView extends StatefulWidget {
  const StoreView({super.key});
  @override
  StoreViewState createState() => StoreViewState();
}

class EquipmentView extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final String image;
  final VoidCallback? onPressed;
  const EquipmentView(
      {super.key,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage(image),
          width: 100,
          height: 100,
        ),
        Text(name),
        Text(description),
        Text('Price: $price'),
      ],
    );
  }
}
