import 'package:flutter/material.dart';
import 'package:nft_wallet/home_screen/pages/home_page/domain/chart_data_model.dart';
import 'package:nft_wallet/home_screen/pages/home_page/domain/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
    required this.leadingImg,
    required this.title,
    required this.subTitle,
    required this.trailingTitleWidget,
    required this.trailingSubtitleWidget,
    required this.hasSpline,
    required this.isProfit,
  }) : super(key: key);

  final String leadingImg;
  final String title;
  final String subTitle;
  final Widget trailingTitleWidget;
  final Widget trailingSubtitleWidget;
  final bool hasSpline;
  final bool isProfit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          // Leading
          Image.asset(
            leadingImg,
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
                title,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 2),

              // Subtitle
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
            ],
          ),

          // Chart
          !hasSpline
              ? const Spacer()
              : Expanded(
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
                          pointColorMapper: (_, __) => isProfit
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.tertiaryContainer,
                          xValueMapper: (ChartData data, _) =>
                              data.year.toString(),
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
              trailingTitleWidget,
              const SizedBox(height: 5),
              trailingSubtitleWidget,
            ],
          ),
        ],
      ),
    );
  }
}
