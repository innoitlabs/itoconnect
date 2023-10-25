import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i2connect/data/bloc/dashboard/dashboard_cubit.dart';
import 'package:i2connect/model/dashboard/dashboard/dashboard_model.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/util/images.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
        //print(data);
        Map<String, double> dataMap = {};
        data.forEach((key, value) => value ?? data.update(key, (value) => 0));
        data.forEach((key, value) {
          dataMap.putIfAbsent(key, () => double.parse(value.toString()));
        });

        return Column(
          children: [
            Container(
              height: 430,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(width: MediaQuery.of(context).size.width - 100, child: Column(
                    children: [
                      const Text(
                        'Voters',
                        style: titleTabHeader,
                      ),
                      const Divider(
                        thickness: 2,
                        color: Color(0xFFD9D9D9),
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.6,
                      //   child: PieChart(
                      //     dataMap: dataMap,
                      //     legendOptions: const LegendOptions(
                      //       showLegendsInRow: true,
                      //       //legendPosition: LegendPosition.right,
                      //       showLegends: false,
                      //       legendTextStyle: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 5,
                      ),
                      SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <ColumnSeries>[
                            ColumnSeries<ChartData, String>(
                                dataSource: [
                                  ChartData('Total Voters', state.voutersCount.total_voters),
                                  ChartData('Male', state.voutersCount.male_voters),
                                  ChartData('Female', state.voutersCount.female_voters),
                                  ChartData('Others', state.voutersCount.other_voters),
                                ],
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Width of the bars
                                width: 0.6,
                                // Spacing between the bars
                                spacing: 0.3)
                          ]),
                      Text(
                        'Total Voters: ${state.voutersCount.total_voters}',
                        style: titleTabHeader,
                      ),
                    ],
                  ),),
                  Container(width: MediaQuery.of(context).size.width - 100, child: Column(
                    children: [
                      const Text(
                        'Caste',
                        style: titleTabHeader,
                      ),
                      const Divider(
                        thickness: 2,
                        color: Color(0xFFD9D9D9),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: PieChart(
                          dataMap: dataMap,
                          legendOptions: const LegendOptions(
                            showLegendsInRow: true,
                            //legendPosition: LegendPosition.right,
                            showLegends: false,
                            legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // SfCartesianChart(
                      //     primaryXAxis: CategoryAxis(),
                      //     series: <ColumnSeries>[
                      //       ColumnSeries<ChartData, String>(
                      //           dataSource: [
                      //             ChartData('BJP', state.favourToList.bJP?.toDouble()),
                      //             ChartData('BRS', state.favourToList.bRS?.toDouble()),
                      //             ChartData('CPM', state.favourToList.cPM?.toDouble()),
                      //             ChartData('INC', state.favourToList.iNC?.toDouble()),
                      //             ChartData('INDP', state.favourToList.iNDP?.toDouble()),
                      //             ChartData('MIM', state.favourToList.mIM?.toDouble()),
                      //             ChartData('NOTA', state.favourToList.nOTA?.toDouble()),
                      //             ChartData('TDP', state.favourToList.tDP?.toDouble()),
                      //             ChartData('TRS', state.favourToList.tRS?.toDouble()),
                      //           ],
                      //           xValueMapper: (ChartData data, _) => data.x,
                      //           yValueMapper: (ChartData data, _) => _,
                      //           // Width of the bars
                      //           width: 0.6,
                      //           // Spacing between the bars
                      //           spacing: 0.3)
                      //     ]),
                      // Text(
                      //   'Total Voters: ${0}',
                      //   style: titleTabHeader,
                      // ),
                    ],
                  ),),
                  Container(width: MediaQuery.of(context).size.width - 100, child: Column(
                    children: [
                      const Text(
                        'Voters Favor To',
                        style: titleTabHeader,
                      ),
                      const Divider(
                        thickness: 2,
                        color: Color(0xFFD9D9D9),
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.6,
                      //   child: PieChart(
                      //     dataMap: dataMap,
                      //     legendOptions: const LegendOptions(
                      //       showLegendsInRow: true,
                      //       //legendPosition: LegendPosition.right,
                      //       showLegends: false,
                      //       legendTextStyle: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 5,
                      ),
                      SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <ColumnSeries>[
                            ColumnSeries<ChartData, String>(
                                dataSource: [
                                  ChartData('BJP', state.favourToList.bJP),
                                  ChartData('BRS', state.favourToList.bRS),
                                  ChartData('CPM', state.favourToList.cPM),
                                  ChartData('INC', state.favourToList.iNC),
                                  ChartData('INDP', state.favourToList.iNDP),
                                  ChartData('MIM', state.favourToList.mIM),
                                  ChartData('NOTA', state.favourToList.nOTA),
                                  ChartData('TDP', state.favourToList.tDP),
                                  ChartData('TRS', state.favourToList.tRS),
                                ],
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Width of the bars
                                width: 0.6,
                                // Spacing between the bars
                                spacing: 0.3)
                          ]),
                      // Text(
                      //   'Total Voters: ${0}',
                      //   style: titleTabHeader,
                      // ),
                    ],
                  ),),


                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     GestureDetector(
            //       onTap: () {},
            //       child: Container(
            //         width: 40,
            //         height: 40,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(40),
            //           color: const Color(0XFFE1E1E1),
            //           boxShadow: [
            //             BoxShadow(
            //                 color: Colors.grey.withOpacity(0.2),
            //                 spreadRadius: 1,
            //                 blurRadius: 5)
            //           ],
            //         ),
            //         child: const Center(
            //             child: Icon(
            //           Icons.chevron_left,
            //           color: Color(0xFF717171),
            //           size: 40,
            //         )),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     GestureDetector(
            //       onTap: () {},
            //       child: Container(
            //         width: 40,
            //         height: 40,
            //         decoration: BoxDecoration(
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.grey.withOpacity(0.2),
            //                 spreadRadius: 1,
            //                 blurRadius: 5,
            //               )
            //             ],
            //             border:
            //                 Border.all(width: 0.5, color: Color(0xFFD8D8D8)),
            //             borderRadius: BorderRadius.circular(40),
            //             color: Colors.white),
            //         child: Center(
            //             child: const Icon(
            //           Icons.chevron_right,
            //           color: Colors.black,
            //           size: 40,
            //         )),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        );
      },
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final int? y;
}
