import 'package:flutter/material.dart';

class CustomActionBottomn extends StatelessWidget {
  final bool isadd;
  final bool isdelet;
  final VoidCallback? showAdd;
  final VoidCallback? deleteContant;

  const CustomActionBottomn({
    required this.showAdd,
    required this.deleteContant,
    required this.isadd,
    required this.isdelet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: isdelet,
          child: FloatingActionButton(
            onPressed: deleteContant,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            child: const Icon(Icons.delete),
          ),
        ),
        const SizedBox(height: 8),
        Visibility(
          visible: isadd,
          child: FloatingActionButton(
            onPressed: showAdd,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
