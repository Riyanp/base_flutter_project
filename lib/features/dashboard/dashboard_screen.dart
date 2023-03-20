import 'package:base_flutter_project/components/text_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "/dashboard";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: TextWidget("DASHBOARD"),
      ),
    );
  }
}
