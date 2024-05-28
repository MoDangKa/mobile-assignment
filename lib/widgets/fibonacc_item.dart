import 'package:flutter/material.dart';
import 'package:mobile_assignment/models/fibonacci.dart';

class FibonacciItem extends StatelessWidget {
  final void Function() onTap;
  final Color color;
  final Fibonacci data;

  static final Map<String, IconData> iconMap = {
    'square': Icons.square_outlined,
    'cross': Icons.close,
    'circle': Icons.circle,
  };

  const FibonacciItem({
    super.key,
    required this.onTap,
    required this.color,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData = iconMap[data.sharp] ?? Icons.error;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: color,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Index ${data.index}, Number ${data.number}'),
              Icon(iconData),
            ],
          ),
        ),
      ),
    );
  }
}
