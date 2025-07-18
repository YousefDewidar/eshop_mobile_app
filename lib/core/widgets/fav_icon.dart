import 'package:flutter/material.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({
    super.key,
  });

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: IconButton(
        onPressed: () {
          setState(() {
            isChanged = !isChanged;
          });
        },
        icon: isChanged
            ? const Icon(Icons.favorite_rounded)
            : const Icon(Icons.favorite_border_rounded),
      ),
    );
  }
}
