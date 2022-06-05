import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.onSubmit,
    required this.onClear,
  }) : super(key: key);

  final Function onSubmit;
  final Function onClear;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final TextEditingController _controller;
  var _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTextChange() {
    if (_controller.text.isEmpty) {
      setState(() {
        _isTextEmpty = true;
      });
    } else {
      setState(() {
        _isTextEmpty = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      height: 54.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 3.0,
              offset: const Offset(0.0, 2.0))
        ],
      ),
      child: TextField(
        controller: _controller,
        autofocus: false,
        cursorHeight: 18.0,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16.0),
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 18.0,
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.grey,
                fontSize: 15.0,
              ),
          suffixIcon: (_isTextEmpty)
              ? const SizedBox()
              : IconButton(
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 18.0,
                  ),
                  onPressed: () {
                    _controller.clear();
                    widget.onClear();
                  }),
        ),
        onSubmitted: (word) {
          widget.onSubmit(word);
        },
      ),
    );
  }
}
