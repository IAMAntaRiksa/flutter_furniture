import 'package:flutter/material.dart';

class CustomeAppBar extends AppBar {
  CustomeAppBar({Key? key})
      : super(
          toolbarHeight: 70,
          key: key,
          elevation: 0,
          backgroundColor: Colors.grey.shade200,
          flexibleSpace: _buildCommerce(),
        );

  static Widget _buildCommerce() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Base Funiture',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Perfect Cohoice!",
                style: TextStyle(fontSize: 14.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
