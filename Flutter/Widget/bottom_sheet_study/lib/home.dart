import 'package:bottom_sheet_study/bottom_sheet.dart';
import 'package:bottom_sheet_study/bottom_sheet_provider.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late BottomSheetProvider bottomSheetProvider;
  double bsHeight = 600.0;
  Widget inner = Container();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('HOME1'),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return CustomBottomSheet();
                    });
              },
              child: Text('Btn'))
        ],
      ),
    );
  }
}
