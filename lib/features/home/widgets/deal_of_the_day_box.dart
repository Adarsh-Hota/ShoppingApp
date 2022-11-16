import 'package:flutter/material.dart';

class DealOfTheDayBox extends StatefulWidget {
  const DealOfTheDayBox({Key? key}) : super(key: key);

  @override
  State<DealOfTheDayBox> createState() => _DealOfTheDayBoxState();
}

class _DealOfTheDayBoxState extends State<DealOfTheDayBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 10,
            top: 15,
          ),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 5,
          width: MediaQuery.of(context).size.width * 7 / 8,
        ),
        Image.network(
          'https://images.unsplash.com/photo-1584433305355-9cb73387fc61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=848&q=80',
          height: 235,
          width: MediaQuery.of(context).size.width * 7 / 8,
          fit: BoxFit.contain,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 10,
            top: 5,
          ),
          child: const Text(
            '\$ 999',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 10,
            top: 5,
          ),
          child: const Text(
            'MacBook Pro',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
