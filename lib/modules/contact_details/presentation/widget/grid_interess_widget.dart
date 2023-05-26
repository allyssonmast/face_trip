import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridInteressWidget extends StatelessWidget {
  final List<String> listInteress;
  const GridInteressWidget({Key? key, required this.listInteress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorsList = const [
      Color(0xFFFFFACD),
      Color(0xFFFFA500),
      Color(0xFFDC143C),
      Color(0xFFFFC0CB)
    ];
    var map = {
      'Beach': Icons.beach_access_outlined,
      'Traking': Icons.beach_access_outlined,
      'Gastronomy': Icons.beach_access_outlined,
      'Cultural': Icons.museum_outlined
    };

    return GridView.custom(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          double? size = index == 0 ? 30 : null;
          return Card(
            color: colorsList[index],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    map[listInteress[index]],
                    size: size,
                  ),
                  Text(
                    listInteress[index],
                    style: TextStyle(fontSize: size),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: listInteress.length,
      ),
    );
  }
}
