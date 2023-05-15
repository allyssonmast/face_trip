import 'package:cached_network_image/cached_network_image.dart';
import 'package:facetrip/core/shered/route/go_route.dart';
import 'package:facetrip/modules/home/presentation/bloc/home_bloc.dart';
import 'package:facetrip/modules/home/presentation/widget/drawer_widget.dart';
import 'package:facetrip/routes/names_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    var list = context.watch<HomeBloc>().state.contacts ?? [];
    var user = context.watch<HomeBloc>().state.user;
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('FaceTrip'),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.confirmation_num))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeBloc>().add(const HomeEvent.addContact());
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Contacts',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  var contact = list[index];
                  return ListTile(
                    title: Text(contact.name),
                    onTap: () => GoTo().route(context, DETAILS_CONTACT),
                    leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                      contact.url,
                    )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
