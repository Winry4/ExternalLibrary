import 'package:flutter/material.dart';

import '../Tab1.dart';
import '../Tab2.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF05D8B2),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.photo)),
                Tab(icon: Icon(Icons.font_download))
              ],
            ),
            centerTitle: true,
            title: Text(
              'PokeWiki',
              textAlign: TextAlign.center,
            ),
          ),
          body: TabBarView(
            children: [
              Tab(
                child: Tab1(),
              ),
              Tab(
                child: Tab2(),
              )
            ],
          ),
        ));
  }
}
