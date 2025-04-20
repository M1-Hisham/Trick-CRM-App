import 'package:flutter/material.dart';

class AppReportsDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final double? verticalPadding;
  final double? horizontalPadding;
  const AppReportsDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 30, horizontal: horizontalPadding ?? 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            headingRowColor: WidgetStateColor.resolveWith(
              (states) => Colors.grey.shade200,
            ),
            border: TableBorder.all(width: 0.5),
            columns: columns,
            rows: rows,
          ),
        ),
      ),
    );
  }
}
