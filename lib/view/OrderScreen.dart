import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('')),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Pending',
                ),
                Tab(
                  text: 'Underway',
                ),
                Tab(
                  text: 'Completed',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [

            Center(child: Text( 'Pending',)),
            Center(child: Text( 'Underway',)),
            Center(child: Text( 'Completed',))
          ]),
        ));
  }
}
