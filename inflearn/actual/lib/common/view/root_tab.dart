import 'package:actual/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RootTab extends StatelessWidget {
  const RootTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      child: Center(child: Text('Root Tab')),
    );
  }
}