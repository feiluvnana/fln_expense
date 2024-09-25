import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/helper.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flnexpense/services/database/database.dart';
import 'package:flnexpense/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/expense_category_provider.dart';
import '../../providers/expense_provider.dart';
import '../../providers/income_category_provider.dart';
import '../../providers/income_provider.dart';

class StatisticsPage extends HookConsumerWidget {
  const StatisticsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = useState(DateTime.now());
    final chartType = useState(0); // 0: histogram, 1: pie
    final statisticType = useState(0); // 0: expense, 1: income

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Row(children: [
            MonthSwitcher(selectedMonth: selectedMonth),
            const Spacer(),
            ChartTypeSwitcher(chartType: chartType)
          ]),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: StatisticTypeSwitcher(statisticType: statisticType)),
          const SizedBox(height: 16),
          if (chartType.value == 0)
            Expanded(
                child: _Histogram(
                    statisticType: statisticType,
                    selectedMonth: selectedMonth)),
          if (chartType.value == 1)
            Expanded(
                child: _Pie(
                    statisticType: statisticType,
                    selectedMonth: selectedMonth)),
          Expanded(
            child: _DetailOfEachCat(
                statisticType: statisticType,
                selectedMonth: selectedMonth,
                randomColor: chartType.value != 0),
          )
        ]),
      ),
    );
  }
}

class ChartTypeSwitcher extends StatelessWidget {
  const ChartTypeSwitcher({super.key, required this.chartType});

  final ValueNotifier<int> chartType;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: chartType.value != 0 ? Colors.white : green100,
            border: Border.all(color: light60),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
        child: GestureDetector(
            onTap: () {
              chartType.value = 0;
            },
            child: FaIcon(FontAwesomeIcons.chartColumn,
                color: chartType.value == 0 ? Colors.white : green100)),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: chartType.value != 1 ? Colors.white : green100,
            border: const Border(
                bottom: BorderSide(color: light60),
                right: BorderSide(color: light60),
                top: BorderSide(color: light60)),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8), bottomRight: Radius.circular(8))),
        child: GestureDetector(
            onTap: () {
              chartType.value = 1;
            },
            child: Icon(FontAwesomeIcons.chartPie,
                color: chartType.value == 1 ? Colors.white : green100)),
      )
    ]);
  }
}

class MonthSwitcher extends StatelessWidget {
  const MonthSwitcher({super.key, required this.selectedMonth});

  final ValueNotifier<DateTime> selectedMonth;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          onPressed: () {
            selectedMonth.value = selectedMonth.value
                .copyWith(month: selectedMonth.value.month - 1);
          },
          icon: const Icon(FontAwesomeIcons.chevronLeft,
              size: 18, color: green100)),
      Text(DateFormat("'Tháng' MM/yyyy").format(selectedMonth.value),
          style: title2),
      IconButton(
          onPressed: () {
            selectedMonth.value = selectedMonth.value
                .copyWith(month: selectedMonth.value.month + 1);
          },
          icon: const Icon(FontAwesomeIcons.chevronRight,
              size: 18, color: green100))
    ]);
  }
}

class StatisticTypeSwitcher extends StatelessWidget {
  const StatisticTypeSwitcher({super.key, required this.statisticType});

  final ValueNotifier<int> statisticType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 36,
      decoration:
          BoxDecoration(color: light60, borderRadius: BorderRadius.circular(8)),
      child: Row(children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              statisticType.value = 0;
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: statisticType.value != 0 ? null : green100,
                  borderRadius: BorderRadius.circular(8)),
              child: Text("Chi tiêu",
                  style: title2.copyWith(
                      color: statisticType.value == 0 ? Colors.white : null)),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              statisticType.value = 1;
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: statisticType.value != 1 ? null : green100,
                  borderRadius: BorderRadius.circular(8)),
              child: Text("Thu nhập",
                  style: title2.copyWith(
                      color: statisticType.value == 1 ? Colors.white : null)),
            ),
          ),
        )
      ]),
    );
  }
}

class _Pie extends HookConsumerWidget {
  const _Pie({required this.selectedMonth, required this.statisticType});

  final ValueNotifier<int> statisticType;
  final ValueNotifier<DateTime> selectedMonth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final touchedIndex = useState<int?>(null);
    final expandedAll = useState(false);
    final totalMoneyAmount = (statisticType.value == 0
            ? ref
                .watch(getExpenseByMonthProvider(selectedMonth.value))
                .valueOrNull
                ?.fold(0, (val, e) => val + e.moneyAmount)
            : ref
                .watch(getIncomeByMonthProvider(selectedMonth.value))
                .valueOrNull
                ?.fold(0, (val, e) => val + e.moneyAmount)) ??
        0;

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 3,
          child: Stack(
            children: [
              if (totalMoneyAmount != 0)
                Center(
                    child: Text(NumberFormat("#,##0đ").format(totalMoneyAmount),
                        style: title2))
              else
                const Center(child: Text("Không có dữ liệu", style: title2)),
              Positioned.fill(
                child: PieChart(PieChartData(
                    centerSpaceRadius: MediaQuery.sizeOf(context).height / 12,
                    sections: (statisticType.value == 0
                            ? ref
                                .watch(getExpenseByMonthProvider(
                                    selectedMonth.value))
                                .valueOrNull
                            : ref
                                .watch(getIncomeByMonthProvider(
                                    selectedMonth.value))
                                .valueOrNull)
                        ?.mapIndexed((i, e) {
                      final isTouched =
                          expandedAll.value || touchedIndex.value == i;
                      final radius = isTouched
                          ? MediaQuery.sizeOf(context).height / 10
                          : MediaQuery.sizeOf(context).height / 12;
                      final id =
                          (e is ExpenseData) ? e.id : (e as IncomeData).id;
                      final catId = (e is ExpenseData)
                          ? e.expenseCategoryId
                          : (e as IncomeData).incomeCategoryId;
                      final color = getRandomColor(id);
                      final moneyAmount = (e is ExpenseData)
                          ? e.moneyAmount
                          : (e as IncomeData).moneyAmount;

                      return PieChartSectionData(
                          radius: radius,
                          showTitle: isTouched,
                          title:
                              "${(moneyAmount / totalMoneyAmount * 100).round()}%",
                          titleStyle: title3,
                          value: moneyAmount.toDouble(),
                          color: getRandomColor(id),
                          badgeWidget: Consumer(builder: (context, ref, child) {
                            final dynamic cat = ref
                                .watch(((e is ExpenseData)
                                    ? getExpenseCategoryByIdProvider
                                    : getIncomeCategoryByIdProvider)(catId))
                                .valueOrNull;
                            return cat == null
                                ? Container()
                                : Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: color),
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                        getIconDataFromStr(
                                            cat.iconType, cat.icon),
                                        size: 16),
                                  );
                          }),
                          badgePositionPercentageOffset: 0.98);
                    }).toList(),
                    pieTouchData:
                        PieTouchData(touchCallback: (event, pieTouchResponse) {
                      if (pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex.value = null;
                      }
                      if (event.isInterestedForInteractions) {
                        touchedIndex.value = pieTouchResponse
                            ?.touchedSection?.touchedSectionIndex;
                      } else {
                        touchedIndex.value = null;
                      }
                    }))),
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                      onPressed: () {
                        expandedAll.value = !expandedAll.value;
                      },
                      icon: Icon(!expandedAll.value
                          ? FontAwesomeIcons.maximize
                          : FontAwesomeIcons.minimize))),
            ],
          ),
        ),
      ],
    );
  }
}

class _Histogram extends HookConsumerWidget {
  const _Histogram({
    required this.statisticType,
    required this.selectedMonth,
  });

  final ValueNotifier<int> statisticType;
  final ValueNotifier<DateTime> selectedMonth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfColumns = getNumberOfDaysInAMonth(
        year: selectedMonth.value.year, month: selectedMonth.value.month);
    final maxY = statisticType.value == 0
        ? ref
            .watch(getExpenseChartHeightByMonthProvider(selectedMonth.value))
            .valueOrNull
        : ref
            .watch(getIncomeChartHeightByMonthProvider(selectedMonth.value))
            .valueOrNull;

    return Column(
      children: [
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height / 3,
            width: maxY == 0 ? 200 : numberOfColumns * 12,
            child: maxY == 0
                ? const Center(child: Text("Không có dữ liệu", style: title2))
                : BarChart(BarChartData(
                    borderData: FlBorderData(
                        border: const Border(
                            left: BorderSide(color: Colors.black26),
                            bottom: BorderSide(color: Colors.black26))),
                    gridData: const FlGridData(show: false),
                    titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                                reservedSize: 36,
                                showTitles: true,
                                getTitlesWidget: (value, meta) => Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                            NumberFormat.compact()
                                                .format(value),
                                            style: tiny.copyWith(
                                                color: Colors.black26)),
                                        Container(
                                            margin:
                                                const EdgeInsets.only(left: 1),
                                            width: 4,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.black26))),
                                      ],
                                    ))),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                                reservedSize: 26,
                                showTitles: true,
                                getTitlesWidget: (value, meta) => Column(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 1),
                                            height: 4,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.black26))),
                                        value % 7 == 1
                                            ? Text(value.toInt().toString(),
                                                style: tiny.copyWith(
                                                    color: Colors.black26))
                                            : const SizedBox()
                                      ],
                                    ))),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false))),
                    minY: 0,
                    maxY: maxY,
                    barGroups: List.generate(
                        numberOfColumns,
                        (index) => BarChartGroupData(
                                barsSpace: 2,
                                x: index + 1,
                                barRods: [
                                  if (statisticType.value == 0)
                                    BarChartRodData(
                                        toY: ref
                                                .watch(getExpenseByDateProvider(
                                                    DateTime(
                                                        selectedMonth
                                                            .value.year,
                                                        selectedMonth
                                                            .value.month,
                                                        index + 1)))
                                                .valueOrNull
                                                ?.fold(
                                                    0.0,
                                                    (val, e) =>
                                                        val + e.moneyAmount)
                                                .toDouble() ??
                                            0,
                                        color: red100,
                                        borderRadius: BorderRadius.zero),
                                  if (statisticType.value == 1)
                                    BarChartRodData(
                                        toY: ref
                                                .watch(getIncomeByDateProvider(
                                                    DateTime(
                                                        selectedMonth
                                                            .value.year,
                                                        selectedMonth
                                                            .value.month,
                                                        index + 1)))
                                                .valueOrNull
                                                ?.fold(
                                                    0.0,
                                                    (val, e) =>
                                                        val + e.moneyAmount)
                                                .toDouble() ??
                                            0,
                                        color: blue100,
                                        borderRadius: BorderRadius.zero),
                                ])),
                    barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                      tooltipPadding:
                          const EdgeInsets.only(top: 4, left: 4, right: 4),
                      getTooltipColor: (group) => green100.withOpacity(0.2),
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                            NumberFormat.compact().format(rod.toY),
                            regular.copyWith(height: 1.2));
                      },
                    )))),
          ),
        ),
      ],
    );
  }
}

class _DetailOfEachCat extends HookConsumerWidget {
  const _DetailOfEachCat({
    required this.statisticType,
    required this.selectedMonth,
    required this.randomColor,
  });

  final ValueNotifier<int> statisticType;
  final ValueNotifier<DateTime> selectedMonth;
  final bool randomColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
        child: Column(children: [
      ...?(statisticType.value == 0
              ? ref
                  .watch(getExpenseByMonthProvider(selectedMonth.value))
                  .valueOrNull
              : ref
                  .watch(getIncomeByMonthProvider(selectedMonth.value))
                  .valueOrNull)
          ?.map((e) {
        final id = e is ExpenseData ? e.id : (e as IncomeData).id;
        final catId = e is ExpenseData
            ? e.expenseCategoryId
            : (e as IncomeData).incomeCategoryId;
        final moneyAmount =
            e is ExpenseData ? e.moneyAmount : (e as IncomeData).moneyAmount;
        final dynamic cat = ref
            .watch((e is ExpenseData
                ? getExpenseCategoryByIdProvider
                : getIncomeCategoryByIdProvider)(catId))
            .valueOrNull;
        return LeadingIconListTile(
            color: randomColor
                ? getRandomColor(id)
                : e is ExpenseData
                    ? red100
                    : blue100,
            title: cat != null ? Text(cat.name, style: title2) : null,
            subtitle: Text(NumberFormat("#,##0đ").format(moneyAmount),
                style: small.copyWith(color: Colors.black54)),
            icon: getIconDataFromStr(cat?.iconType, cat?.icon ?? 0));
      })
    ]));
  }
}
