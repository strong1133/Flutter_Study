import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_study/layout/default_layout.dart';
import 'package:river_pod_study/riverpod/future_provider.dart';
import 'package:river_pod_study/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {

     tabController = TabController(length: 10, vsync: this, initialIndex: ref.read(listenProvider));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ref.listen(listenProvider, (previous, next){
      print("previous ${previous}");
      print("next ${next}");

      if(previous != next){
        tabController.animateTo(next);
      }
    });

    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: List.generate(
          10,
          (index) => Column(
            children: [
              Text(index.toString()),
              ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).update((state) => state == 10 ? 10 : state+1);
                },
                child: Text('다음'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).update((state) => state == 0 ? 0 : state-1);
                },
                child: Text('이전'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
