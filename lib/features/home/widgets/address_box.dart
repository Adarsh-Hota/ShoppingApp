import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_shop_app/providers/user_provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getUser;
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 162, 236, 233),
          ],
          stops: [
            0.5,
            1.0,
          ],
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, size: 20),
          Expanded(
            child: Text(
              'Delivery to ${user.name} - ${user.address}',
              style: const TextStyle(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 4,
              top: 2,
            ),
            child: Icon(
              Icons.arrow_drop_down_outlined,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
