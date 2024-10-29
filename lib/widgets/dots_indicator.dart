import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int currentPage;
  final int itemCount;

  const DotsIndicator({
    super.key,
    required this.currentPage,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(left: 8.0),
          height: 8.0,
          width: currentPage == index ? 24.0 : 8.0,
          decoration: BoxDecoration(
            color: currentPage == index
                ? const Color(0xFF1E4FF1)
                : const Color(0xFFD3D3D3),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
