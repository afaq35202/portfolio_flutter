import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';

import '../data_model/items_data_model.dart';
import '../utils/responsive.dart';
import 'content_widget.dart';

class GridItem extends StatelessWidget {
  final ItemsDataModel model;

  const GridItem({super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 0.5)),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Responsive.isMobile(context) ? 20 : 25,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          ContentWidget(
            model: model,
          ),
          const Spacer(),
          Expanded(
            child: Text(
              model.description,
              style:
                  TextStyle(fontSize: Responsive.isMobile(context) ? 13 : 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
