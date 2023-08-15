import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i2connect/data/bloc/dashboard/dashboard_cubit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/util/images.dart';

class DashBoardCharts extends StatelessWidget {
  const DashBoardCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        Map<String, dynamic> data = state.casteList.toJson();
        Map<String, double> dataMap = {};
        data.forEach((key, value) =>
            value == null ? data.update(key, (value) => 0) : null);
        data.forEach((key, value) {
          dataMap.putIfAbsent(key, () => double.parse(value.toString()));
        });

        return Container(
          padding: const EdgeInsets.only(top: 5),
          height: 420,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).highlightColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5)
              ],
              border: Border.all(width: 1, color: Color(0xFFD8D8D8))),
          child: Column(
            children: [
              Text(
                'Caste',
                style: titleTabHeader,
              ),
              Divider(
                thickness: 2,
                color: Color(0xFFD9D9D9),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: PieChart(
                  dataMap: dataMap,
                  legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: false,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Total Voters: ${0}',
                style: titleTabHeader,
              ),
            ],
          ),
        );
      },
    );
  }
}
