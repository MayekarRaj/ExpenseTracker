import 'package:flutter/material.dart';

class AllExpenses extends StatelessWidget {
  const AllExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("All Expenses"),
      ),
      body: ListView.builder(
        // padding: EdgeInsets.symmetric(vertical: 30),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("expense"),
          );
        },
      ),
    );
  }
}
