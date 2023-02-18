import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget with PreferredSizeWidget {
  final ValueChanged<String> onSearch;
  final TextEditingController searchController;

  const SearchBar(
      {Key? key, required this.searchController, required this.onSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: searchController,
        builder: (BuildContext context, TextEditingValue value, _) {
          print(value.text.isNotEmpty);
          return AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0.0,
            title: TextField(
              controller: searchController,
              onChanged: (value) {
                onSearch(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
            leading: value.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear,color: Colors.black,),
                    onPressed: () {
                      searchController.clear();
                      onSearch('');
                    },
                  )
                : null,
          );
        });
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
