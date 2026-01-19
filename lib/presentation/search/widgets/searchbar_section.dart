import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({
    super.key,
    required TextEditingController textEditingController,
    required this.theme,
    this.selectedFilter = 'all',
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;
  final ThemeData theme;
  final String selectedFilter;

  @override
  Widget build(BuildContext context) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 5),
      child: CupertinoSearchTextField(
        controller: _textEditingController,
        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            CupertinoIcons.search,
            color: theme.iconTheme.color,
          ),
        ),
        suffixIcon: Icon(
          CupertinoIcons.clear_circled_solid,
          color: theme.iconTheme.color,
        ),
        onChanged: (value) {
          EasyDebounce.debounce(
              'suggestions', // <-- An ID for this particular debouncer
              const Duration(milliseconds: 500), // <-- The debounce duration
              () => BlocProvider.of<SearchBloc>(context)
                      .add(SearchEvent.getSearchSuggestion(
                    query: _textEditingController.text,
                    serviceType: settingsBloc.state.ytService,
                  )) // <-- The target method
              );
        },
        onSubmitted: (value) {
          if (value == '') {
            return;
          }
          EasyDebounce.cancel('suggestions');
          BlocProvider.of<SearchBloc>(context).add(SearchEvent.getSearchResult(
            query: _textEditingController.text,
            filter: selectedFilter,
            serviceType: settingsBloc.state.ytService,
          ));
        },
      ),
    );
  }
}
