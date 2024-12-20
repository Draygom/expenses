import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(this.label, this.value, this.percentage, {Key? key})
      : super(key: key);

  final String label;
  final double value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            SizedBox(
                height: constraints.maxHeight * 0.14,
                child:
                    FittedBox(child: Text('R\$${value.toStringAsFixed(2)}'))),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
                height: constraints.maxHeight * 0.6,
                width: 15,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            color: const Color.fromRGBO(220, 220, 220, 1),
                            borderRadius: BorderRadius.circular(5))),
                    FractionallySizedBox(
                      heightFactor: percentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label)),
            ),
          ],
        );
      },
    );
  }
}
