import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:life_cycle/counter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int cnt = 0;



  @override
  void initState() {
    super.initState();
    print('HOME > initState');
  }

  void increase() {
    print("// increase");
    setState(() {
      cnt += 1;
    });
  }

  void decrease() {
    
    print("// decrease");
    setState(() {
      cnt -= 1;
    });
  }

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('HOME didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('HOME didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();

    print('HOME deactivate');
  }

  @override
  void dispose() {
    super.dispose();

    print('HOME dispose');
  }

  @override
  Widget build(BuildContext context) {
    print("HOME BUILD > StatefulWidget");

    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Counter(cnt: cnt),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    increase();
                  },
                  child: const Text('increase')),
              ElevatedButton(
                  onPressed: () {
                    decrease();
                  },
                  child: const Text('decrease'))
            ],
          ),

        ],
      ),
    );
  }
}
