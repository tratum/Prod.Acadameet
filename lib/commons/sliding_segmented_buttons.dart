import 'package:flutter/material.dart';

class SlidingSegmentedButtons extends StatefulWidget {
  const SlidingSegmentedButtons({super.key});

  @override
  State<SlidingSegmentedButtons> createState() =>
      _SlidingSegmentedButtonsState();
}

class _SlidingSegmentedButtonsState extends State<SlidingSegmentedButtons> {
  final List<String> _options = ['Low', 'High'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 150,
        decoration: BoxDecoration(
          color: const Color(0XFF202020),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _options.map((option) {
            int index = _options.indexOf(option);
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: _selectedIndex == index
                      ? const Color(0XFFB60000)
                      : const Color(0XFF202020),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Text(
                  option,
                  style: TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 18,
                    fontWeight: _selectedIndex == index
                        ? FontWeight.w600
                        : FontWeight.w500,
                    letterSpacing: 1.2,
                    color: _selectedIndex == index
                        ? const Color(0XFFFFFFFF)
                        : const Color(0XFFFFFFFF),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
