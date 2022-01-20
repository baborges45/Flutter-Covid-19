import 'package:covid_tracker/View/reusable_row.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldState extends StatefulWidget {
  const WorldState({Key? key}) : super(key: key);

  @override
  State<WorldState> createState() => _WorldStateState();
}

class _WorldStateState extends State<WorldState> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xFF0F3BFF),
    const Color(0xFF049E0C),
    const Color(0xFFEC1A06),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              PieChart(
                dataMap: const {
                  "Total": 20,
                  "Recovered": 15,
                  "Deaths": 5,
                },
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions:
                    LegendOptions(legendPosition: LegendPosition.left),
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorList,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .06,
                ),
                child: Card(
                  child: Column(
                    children: [
                      ReusableRow(title: 'Total', value: '200'),
                      ReusableRow(title: 'Total', value: '200'),
                      ReusableRow(title: 'Total', value: '200'),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF049E0C),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Track Countires'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
