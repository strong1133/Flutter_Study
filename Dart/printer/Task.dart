class Task {
  List? task = [];

  void add(String title) {
    task?.add(title);
  }

  remove() {
    return task?.remove(task?[0]);
  }

  getCount() {
    return task?.length;
  }

  getTaskName() {
    return task?[0];
  }
}
