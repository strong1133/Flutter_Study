import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:search_bar01/search_controller.dart';

class SearchBarCustom extends StatefulWidget {
  const SearchBarCustom({Key? key}) : super(key: key);

  @override
  _SearchBarCustomState createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  SearchController searchController = Get.put(SearchController());

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  late FocusNode myFocusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.3),
                    offset: const Offset(0, 3),
                    blurRadius: 5.0)
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 1, 1, 1),
                  child: Row(
                    children: [
                      Flexible(
                          child: TextField(
                        focusNode: myFocusNode,
                        onTap: () {
                          searchController.openner();
                        },
                        onSubmitted: (q) {
                          searchController.search();
                        },
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: Theme.of(context).textTheme.caption,
                            border: InputBorder.none),
                      )),
                      MaterialButton(
                        shape: const CircleBorder(),
                        onPressed: () {},
                        child: const Padding(
                            padding: EdgeInsets.all(3),
                            child: Icon(Icons.search)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Visibility(
                      visible: searchController.isLoading,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const LinearProgressIndicator(),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
