import 'package:facetrip/core/constants/constants.dart';
import 'package:facetrip/core/shered/widget/no_item_widget.dart';
import 'package:facetrip/modules/home/presentation/widget/contact_widget.dart';
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: paddingSmall,
          child: CupertinoTextFormFieldRow(
            placeholder: 'Type a email and search for a frind',
            padding: paddingMedium,
            controller: textController,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Padding(
          padding: paddingSmall,
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
            'Friends',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        list.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      var contact = list[index];
                      return ContactWidget(contact: contact);
                    }),
              )
            : const NoItemWidget()
      ],
    );
  }
}
