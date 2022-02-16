import 'package:flutter/material.dart';

import 'ColoredLinearProgressIndicator.dart';

class SearchBarCustom extends StatefulWidget {
  const SearchBarCustom({Key? key}) : super(key: key);

  @override
  _SearchBarCustomState createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 1, 1, 1),
                  child: Row(
                    children: [
                      Flexible(
                          child: TextField(
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
                Visibility(
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 1, 2, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: const LinearProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
