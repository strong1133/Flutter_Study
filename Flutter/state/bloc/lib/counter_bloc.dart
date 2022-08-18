import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int count = 0;
  String count2 = 'ㄱ';

  late BehaviorSubject<int> _subjectCounter;

  CounterBloc({required this.count}) {
    _subjectCounter = BehaviorSubject<int>.seeded(this.count);
  }
  
  Stream<int> get stream => _subjectCounter.stream;

  void increment() {
    count++;
    _subjectCounter.sink.add(count);
  }

  void decrement() {
    count--;
    _subjectCounter.sink.add(count);
  }

  void reset() {
    count = 0;
    _subjectCounter.sink.add(count);
  }

  void dispose() {
    _subjectCounter.close();
  }
}
