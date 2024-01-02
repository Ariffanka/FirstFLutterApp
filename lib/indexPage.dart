import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import './image.dart' as ImageV;
import './music.dart' as MusicV;
import './list.dart' as listV;
import './listV.dart';

class IndexPage extends StatefulWidget {
  const IndexPage();

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Icon(
          Icons.abc,
          size: 50.0,
        ),
        toolbarHeight: 50.0,
        actions: [Icon(Icons.search)],
      ),
      body: TabBarView(
          controller: controller, children: [MusicV.Music(), ImageV.Images()]),
      bottomNavigationBar: Material(
        color: Colors.grey[900],
        child: TabBar(
          controller: controller, // Sediakan controller pada TabBar
          tabs: [
            Tab(
              icon: Icon(Icons.my_library_music),
            ),
            Tab(
              icon: Icon(Icons.photo_library_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
