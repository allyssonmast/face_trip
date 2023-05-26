import 'package:auto_route/auto_route.dart';
import 'package:facetrip/core/shered/widget/error_widget.dart';
import 'package:facetrip/core/shered/widget/my_circular_indicator.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/search/presentation/bloc/search_bloc.dart';
import 'package:facetrip/modules/search/presentation/pages/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchContacts extends StatefulWidget {
  const SearchContacts({Key? key}) : super(key: key);

  @override
  _SearchContactsState createState() => _SearchContactsState();
}

class _SearchContactsState extends State<SearchContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: BlocProvider<SearchBloc>(
          create: (_) => getIt<SearchBloc>(),
          child: BlocConsumer<SearchBloc, SearchState>(
            listener: (context, state) {
              if (state.status.isLoaded) {}
            },
            builder: (context, state) {
              if (state.status.isInitial) {
                context.read<SearchBloc>().add(const SearchEvent.started());
              }
              if (state.status.isLoaded) {
                return const SearchWidget();
              } else if (state.status.isError) {
                return const FailureWidget();
              } else {
                return const MyCircularIndicator();
              }
            },
          )),
    );
  }
}
