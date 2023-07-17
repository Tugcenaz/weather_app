
import 'package:flutter/material.dart';

import '../components/page_background_widget.dart';

class MasterPage extends StatelessWidget {
  const MasterPage({Key? key}) : super(key: key);

  Widget _buildListTile({required int index}) {
    return ListTile(
      title: const Text("Test"),
      subtitle: Text("index $index"),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (_, int index) {
          return _buildListTile(index: index);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageBackGroundWidget(),
          _buildBody(),
        ],
      ),
    );
  }
}

