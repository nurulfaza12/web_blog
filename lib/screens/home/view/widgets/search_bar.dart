import 'package:flutter/material.dart';
import 'package:web_blog/utils/palette.dart';

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
  final _controller = TextEditingController();
  var _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChange);
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
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      margin: const EdgeInsets.all(10.0),
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
        textAlignVertical: TextAlignVertical.top,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Palette.text),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 18.0,
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.grey,
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
