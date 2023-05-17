import 'package:facetrip/core/constants/constants.dart';
import 'package:flutter/material.dart';

class InteressesWidget extends StatelessWidget {
  final List<String> list;
  final Function(bool, String) changeList;
  const InteressesWidget(
      {Key? key, required this.list, required this.changeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var map = {
      'Beach': Icons.beach_access_outlined,
      'Traking': Icons.terrain,
      'Gastronomy': Icons.restaurant_outlined,
      'Cultural': Icons.museum_outlined,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: paddingLarge,
          child: Text(
            'Interesses',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ListView.builder(
          itemCount: map.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return SwitchListTile(
              selected: list.contains(map.keys.elementAt(index)),
              value: list.contains(map.keys.elementAt(index)),
              secondary: Icon(map.values.elementAt(index)),
              title: Text(map.keys.elementAt(index)),
              onChanged: (onchange) =>
                  changeList(onchange, map.keys.elementAt(index)),
            );
          },
        ),
      ],
    );
  }
}
