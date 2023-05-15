import 'package:cached_network_image/cached_network_image.dart';
import 'package:facetrip/core/shered/widget/no_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    var list = context.watch<SearchBloc>().state.contacts ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoTextFormFieldRow(
            placeholder: 'Search a friend',
            padding: const EdgeInsets.all(16),
            controller: textController,
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(10),
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            onChanged: (value) {
              // Faça algo com o valor do texto digitado
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => context
                .read<SearchBloc>()
                .add(SearchEvent.search(textController.text)),
            child: const Text('Search'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Last searchs',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        list.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      var contact = list[index];
                      return ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(contact.url),
                        ),
                        horizontalTitleGap: 0,
                        title: Text(contact.name),
                        trailing: const Icon(Icons.delete_outline),
                      );
                    }),
              )
            : const NoItemWidget()
      ],
    );
  }
}
