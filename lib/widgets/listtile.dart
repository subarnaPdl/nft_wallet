import 'package:flutter/material.dart';
import 'package:nft_wallet/home_screen/pages/home_page/domain/chart_data_model.dart';
import 'package:nft_wallet/home_screen/pages/home_page/domain/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class MyListTile extends StatelessWidget {
  MyListTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  // Format integers
  // 1000 => 1,000
  final NumberFormat formatNum = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          // Leading
          Image.asset(
            'assets/images/stocks/${tokens[index].img}',
            height: 56,
            width: 56,
          ),

          const SizedBox(width: 10),

          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                tokens[index].shortForm,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 2),

              // Subtitle
              Text(
                tokens[index].fullForm,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
            ],
          ),

          // Chart
          Expanded(
            child: SizedBox(
              height: 80,
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(isVisible: false),
                primaryYAxis: CategoryAxis(isVisible: false),
                legend: Legend(isVisible: false),
                tooltipBehavior: TooltipBehavior(enable: false),
                series: <ChartSeries<ChartData, String>>[
                  LineSeries(
                    dataSource: data,
                    pointColorMapper: (_, __) => tokens[index].isIncreased
                        ? Theme.of(context).colorScheme.tertiary
                        : Theme.of(context).colorScheme.tertiaryContainer,
                    xValueMapper: (ChartData data, _) => data.year.toString(),
                    yValueMapper: (ChartData data, _) => data.value,
                  )
                ],
              ),
            ),
          ),

          // Trailing
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$${formatNum.format(tokens[index].value)}'),
              const SizedBox(height: 5),
              Text(
                '${tokens[index].isIncreased ? '+' : '-'}${tokens[index].changeRate}%',
                style: TextStyle(
                    color: tokens[index].isIncreased
                        ? Theme.of(context).colorScheme.tertiary
                        : Theme.of(context).colorScheme.tertiaryContainer),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
