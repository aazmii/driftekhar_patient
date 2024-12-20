import 'package:com.codeconnect.driftekhar.patient/src/modules/home/models/tab.model.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key, required this.tabs});
  final List<TabModel> tabs;
  List<Widget> get children => tabs.map((e) => e.child).toList();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            tabs: tabs.map((e) => Tab(text: e.title)).toList(),
          ),
          Expanded(child: TabBarView(children: children)),
        ],
      ),
    );
  }
}
