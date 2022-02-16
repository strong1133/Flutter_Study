import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:implicitly_animated_list/implicitly_animated_list.dart';
import 'package:search_bar01/search_controller.dart';
import 'package:search_bar01/search_place.dart';

class SearchResultList extends StatefulWidget {
  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 800,
      constraints: BoxConstraints(maxHeight: 600),
      color: Colors.transparent,
      child: implResultList(),
    );
  }

  Widget implResultList() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: ImplicitlyAnimatedList<Place>(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemData: searchController.suggestions,
          insertDuration: const Duration(milliseconds: 350),
          itemBuilder: (_, item) {
            print(
              searchController.suggestions,
            );
            return buildItem(item);
          },
        ),
      ),
    );
  }

  Widget buildItem(Place place) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            Future.delayed(const Duration(milliseconds: 200), () => {});
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  width: 36,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: searchController.suggestions == history
                        ? const Icon(Icons.history, key: Key('history'))
                        : const Icon(Icons.place, key: Key('place')),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.level2Address,
                        style: textTheme.bodyText2
                            ?.copyWith(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // if (searchController.suggestions.isNotEmpty &&
        //     place != searchController.suggestions.last)
        const Divider(height: 1),
      ],
    );
  }
}
