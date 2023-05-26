import 'package:facetrip/core/constants/constants.dart';
import 'package:facetrip/core/shered/widget/no_item_widget.dart';

import 'package:facetrip/modules/home/presentation/bloc/home_bloc.dart';
import 'package:facetrip/modules/home/presentation/widget/contact_widget.dart';
import 'package:facetrip/modules/home/presentation/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.watch<HomeBloc>().state.contacts ?? [];

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
      body: list.isEmpty
          ? const NoItemWidget()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: paddingTitele,
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
                        return ContactWidget(contact: contact);
                      }),
                ),
              ],
            ),
    );
  }
}
