import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:your_shop_app/common/widgets/custom_button.dart';
import 'package:your_shop_app/common/widgets/custom_textfield.dart';
import 'package:your_shop_app/constants/global_variables.dart';

class AddProductsScreen extends StatefulWidget {
  static const String routeName = '/add_product';

  const AddProductsScreen({Key? key}) : super(key: key);

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  final productNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];
  String dropdownvalue = 'Mobiles';

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Add Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
                  strokeCap: StrokeCap.round,
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.folder_open,
                          size: 40,
                        ),
                        Text(
                          'Select Product Images',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: productNameController,
                  text: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: descriptionController,
                  text: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: priceController,
                  text: 'Price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: quantityController,
                  text: 'Quantity',
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map(
                      (String category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropdownvalue = newValue!;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: 'Sell',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
