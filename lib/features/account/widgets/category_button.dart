import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CategoryButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: OutlinedButton(
          onPressed: () => onTap,
          style: ElevatedButton.styleFrom(
            primary: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
