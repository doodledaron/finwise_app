import 'package:flutter/material.dart';

import '../../../../utils/global_variables.dart';

class YearsToGrow extends StatelessWidget {
  const YearsToGrow(
      {super.key, required this.yearsToGrow, required this.onChanged});
  final int yearsToGrow;
  final Function(int) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'YEARS TO GROW',
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontSize: 17,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '$yearsToGrow years',
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontSize: 20,
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Slider(
          value: yearsToGrow.toDouble(),
          min: 0,
          max: 50,
          thumbColor: GlobalVariables.secondaryColor,
          activeColor: GlobalVariables.secondaryColor,
          divisions: 50,
          onChanged: (value) {
            onChanged(value.toInt());
          },
        ),
      ],
    );
  }
}
