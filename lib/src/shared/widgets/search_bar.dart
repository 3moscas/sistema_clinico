import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({required this.onSearch, super.key});
  final Function(String) onSearch;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(final BuildContext context) => TextField(
    controller: _searchController,
    onSubmitted: widget.onSearch,
    decoration: InputDecoration(
      hintText: 'Pesquisar...',
      suffixIcon: InkWell(
        onTap: () => widget.onSearch(_searchController.text),
        child: const Icon(Icons.search_rounded),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
