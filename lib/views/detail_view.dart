import 'package:expense_tracker/widgets/barchart_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DetailedViews extends StatefulWidget {
  const DetailedViews({super.key});

  @override
  State<DetailedViews> createState() => _DetailedViewsState();
}

class _DetailedViewsState extends State<DetailedViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            AspectRatio(
              aspectRatio: 1.6,
              child: BarChartWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
