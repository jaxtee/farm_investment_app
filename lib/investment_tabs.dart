import 'package:flutter/material.dart';
import 'package:iboro/components/tapped.dart';
import 'package:iboro/components/untapped.dart';
import 'package:iboro/tabs/active_tab.dart';
import 'package:iboro/tabs/completed_tab.dart';
import 'package:iboro/tabs/pending_tab.dart';

class InvestmentTabs extends StatefulWidget {
  @override
  _InvestmentTabsState createState() => _InvestmentTabsState();
}

class _InvestmentTabsState extends State<InvestmentTabs>
    with SingleTickerProviderStateMixin {
  var text1 = 'Active';
  var text2 = 'Pending';
  var text3 = 'Finished';

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        switch (_tabController.index) {
          case 0:
            TabTapped(text: text1);
            break;
          case 1:
            TabTapped(text: text2);
            break;
          case 2:
            TabTapped(text: text3);
            break;
          default:
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _appBar = AppBar().preferredSize.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(_appBar / 1.1),
              child: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                bottom: TabBar(
                  onTap: (index) {
                    setState(() {
                      switch (index) {
                        case 0:
                          TabTapped(text: text1);
                          break;
                        case 1:
                          TabTapped(text: text2);
                          break;
                        case 2:
                          TabTapped(text: text3);
                          break;
                        default:
                      }
                    });
                  },
                  indicatorColor: Colors.white,
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                        child: _tabController.index == 0
                            ? TabTapped(
                                text: text1,
                              )
                            : TabUntapped(text: text1)),
                    Tab(
                        child: _tabController.index == 1
                            ? TabTapped(text: text2)
                            : TabUntapped(text: text2)),
                    Tab(
                        child: _tabController.index == 2
                            ? TabTapped(text: text3)
                            : TabUntapped(text: text3)),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[Active(), Pending(), Completed()],
            ),
          )),
    );
  }
}
