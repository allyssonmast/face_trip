import 'dart:math';

import 'package:facetrip/core/shered/route/go_route.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ContactDetailsWidget extends StatelessWidget {
  final UserEntity userEntity;
  const ContactDetailsWidget({Key? key, required this.userEntity})
      : super(key: key);

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
    var textIcons = ['Praia', 'Traking', 'Gastronomia', 'Cultural'];
    var titleList = ['Natal', 'Paris', 'Rio de Janeiro', 'Bonito'];
    var subList = [
      '* 3 dias de Viagem * Em grupo (4 pessoas) * Praia',
      '* 7 dias de viagem * Em casal (2 Pessoas) * Cultura',
      '* 7 dias de Viagem * Em grupo (4 pessoas) * Praia',
      '* 5 dias de Viagem * Em grupo (8 pessoas) * Natureza'
    ];

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverAppBar(
            expandedHeight: 180,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    GoTo().back(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
            actions: [
              CircleAvatar(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.ios_share),
                ),
              ),
            ],
            flexibleSpace: Image.network(
              'https://www.carpemundi.com.br/wp-content/uploads/2022/01/frases-de-viagem-cm.jpg',
              fit: BoxFit.cover,
            ),
            pinned: true,
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(userEntity.url),
                ),
                trailing: ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Seguir'),
                  icon: const Icon(Icons.add),
                ),
                title: Text(userEntity.name),
                subtitle: Text(userEntity.isTraveled == true
                    ? 'Is traveling '
                    : 'Is not traveling'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text(userEntity.description),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Text(
                  'Interesses',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              GridView.custom(
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  'Viagens',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color getRandomColor() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
}
