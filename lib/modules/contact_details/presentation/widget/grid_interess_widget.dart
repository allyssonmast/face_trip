import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridInteressWidget extends StatelessWidget {
  const GridInteressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mapIcons = [
      Icons.beach_access_outlined,
      Icons.terrain,
      Icons.restaurant_outlined,
      Icons.museum_outlined
    ];
    var colorsList = const [
      Color(0xFFFFFACD),
      Color(0xFFFFA500),
      Color(0xFFDC143C),
      Color(0xFFFFC0CB)
    ];
    var textIcons = ['Beach', 'Traking', 'Gastronomy', 'Cultural'];
    var titleList = ['Natal', 'Paris', 'Rio de Janeiro', 'Bonito'];
    var subList = [
      '* 3 dias de Viagem * Em grupo (4 pessoas) * Praia',
      '* 7 dias de viagem * Em casal (2 Pessoas) * Cultura',
      '* 7 dias de Viagem * Em grupo (4 pessoas) * Praia',
      '* 5 dias de Viagem * Em grupo (8 pessoas) * Natureza'
    ];
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
                    mapIcons[index],
                    size: size,
                  ),
                  Text(
                    textIcons[index],
                    style: TextStyle(fontSize: size),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: mapIcons.length,
      ),
    );
  }
}
