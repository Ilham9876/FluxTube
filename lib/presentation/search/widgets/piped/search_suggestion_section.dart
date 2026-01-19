import 'package:flutter/material.dart';
import 'package:fluxtube/application/search/search_bloc.dart';
import 'package:fluxtube/core/constants.dart';

class SearchSuggestionSection extends StatelessWidget {
  const SearchSuggestionSection({
    super.key,
    required TextEditingController textEditingController,
    required this.state,
    required this.onSearch,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;
  final SearchState state;
  final void Function(String query) onSearch;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          final suggestion = state.suggestions[index] ?? '';
          return InkWell(
            onTap: () {
              _textEditingController.text = suggestion;
              FocusScope.of(context).unfocus();
              onSearch(suggestion);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.search, size: 20),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      suggestion,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _textEditingController.text = suggestion;
                      _textEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: _textEditingController.text.length),
                      );
                    },
                    child: const Icon(Icons.north_west, size: 18),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => kHeightBox5,
        itemCount: state.suggestions.length);
  }
}
