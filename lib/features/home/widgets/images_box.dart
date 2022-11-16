import 'package:flutter/material.dart';

class ImagesBox extends StatelessWidget {
  const ImagesBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 4,
            top: 8,
            right: 8,
            bottom: 8,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 4,
                ),
                child: Image.network(
                  'https://images.unsplash.com/photo-1602080858428-57174f9431cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=951&q=80',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 4,
                ),
                child: Image.network(
                  'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGdhbWluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 4,
                ),
                child: Image.network(
                  'https://images.unsplash.com/photo-1636036824578-d0d300a4effb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZXNwb3J0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 4,
                ),
                child: Image.network(
                  'https://images.unsplash.com/photo-1485955900006-10f4d324d411?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 4,
                ),
                child: Image.network(
                  'https://images.unsplash.com/photo-1564466809058-bf4114d55352?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
