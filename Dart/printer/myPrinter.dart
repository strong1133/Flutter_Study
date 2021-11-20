import 'Task.dart';
import 'printer.dart';
import 'queue.dart';

class MyPrinter extends Printer implements Queue {
  Task task = new Task();

  @override
  deQueue() {
    return task.remove();
  }

  @override
  enQueue(String title) {
    task.add(title);
    print(task.toString());
  }

  @override
  getSize() {
    return task.getCount();
  }

  getTaskName() {
    return task.getTaskName();
  }
}
