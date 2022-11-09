import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String src;

  const SingleProduct({
    Key? key,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1.5,
        ),
      ),
      child: Image.network(
        height: 180,
        width: 180,
        fit: BoxFit.cover,
        src,
      ),
    );
  }
}
