import 'package:expense_tracker/widgets/drawer_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showMore = false;
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   elevation: 0,
      //   // backgroundColor: Colors.transparent,
      //   // backgroundColor: Colors.transparent,
      //   // leading: IconButton(
      //   //   onPressed: () {},
      //   //   icon: const Icon(Icons.menu_rounded),
      //   //   color: Colors.black,
      //   // ),
      //   title: const Text(
      //     "Expanse Tracker",
      //     // style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,

      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.settings),
      //       // color: Colors.black,
      //     ),
      //   ],
      // ),
      drawer: DrawerWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addExpense');
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu_rounded),
                ),
                Text(
                  "Expense Tracker",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
            Container(
              // color: Colors.black,
              child: AspectRatio(
                aspectRatio: 5 / 4,
                child: PageView(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/details');
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PieChart(
                            PieChartData(
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 60,
                                sections: showingSections()),
                          ),
                          const Text(
                            "\u{20B9}${250}",
                            style: TextStyle(fontSize: 26),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 80,
                          color: Colors.blue,
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Weekly Expense',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  '\u{20B9}${250}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 20), // Adding spacing between containers
                        Container(
                          width: 200,
                          height: 80,
                          color: Colors.blue,
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Monthly Expense',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  '\u{20B9}${250}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Recent Expenses"),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                // itemCount: showMore ? items.length : items.length + 1,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                  // if (index < 5) {
                  //   return ListTile(
                  //     title: Text(items[index]),
                  //   );
                  // } else {
                  //   return Center(
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           showMore = true;
                  //         });
                  //       },
                  //       child: Text('See More'),
                  //     ),
                  //   );
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      // final isTouched = i == touchedIndex;
      // final fontSize = isTouched ? 25.0 : 16.0;
      // final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            // color: AppColors.contentColorBlue,
            color: Colors.orange,
            value: 40,
            showTitle: false,
            // title: '40%',
            // radius: radius,
            radius: 10,
            titleStyle: const TextStyle(
              // fontSize: fontSize,
              fontWeight: FontWeight.bold,
              // color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            // color: AppColors.contentColorYellow,
            color: Colors.red,
            value: 30,
            // title: '30%',
            // radius: radius,
            radius: 10,
            showTitle: false,
            titleStyle: const TextStyle(
              // fontSize: fontSize,
              fontWeight: FontWeight.bold,
              // color: Colors.orange,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.blue,
            value: 15,
            showTitle: false,
            // title: '15%',
            // radius: radius,
            radius: 10,

            titleStyle: const TextStyle(
              // fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            // color: AppColors.contentColorGreen,
            color: Colors.green,
            value: 15,
            showTitle: false,
            // title: '15%',
            // radius: radius,
            radius: 10,

            titleStyle: const TextStyle(
              // fontSize: fontSize,
              fontWeight: FontWeight.bold,
              // color: Colors.red,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
