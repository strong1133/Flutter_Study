import 'package:easy_localization/easy_localization.dart';
import 'package:fatos_flutter_getx_study01/app/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../models/search_place.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    print('@@@@@ 1 @@@@@. ${context.hashCode}');
    return Container(child: SearchBar(context));
  }

  Widget SearchBar(context) {
    return Builder(builder: (BuildContext context2) {
      return Visibility(
        visible: true, // visible 설정
        child: GetBuilder<SearchController>(builder: (searchController) {
          return Container(
              margin: const EdgeInsets.all(10),
              child: buildFloatingSearchBar(context2));
        }),
      );
    });
  }

  Widget buildFloatingSearchBar(context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    print('@@@@@ 2 @@@@@@. ${context.hashCode}');
    return FloatingSearchBar(
      backdropColor: Colors.transparent,
      hint: tr('search'),
      scrollPadding: const EdgeInsets.all(0),
      transitionDuration: const Duration(milliseconds: 1),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: double.infinity,
      debounceDelay: const Duration(milliseconds: 0),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      onSubmitted: (query) {
        searchController.onQueryChanged(query);
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, _) => buildExpandableBody(searchController),
    );
  }

  Widget buildExpandableBody(SearchController searchController) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: ImplicitlyAnimatedList<Place>(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          items: searchController.suggestions,
          insertDuration: const Duration(milliseconds: 700),
          itemBuilder: (context, animation, item, i) {
            return SizeFadeTransition(
              animation: animation,
              child: buildItem(context, item),
            );
          },
          updateItemBuilder: (context, animation, item) {
            return FadeTransition(
              opacity: animation,
              child: buildItem(context, item),
            );
          },
          areItemsTheSame: (a, b) => a == b,
        ),
      ),
    );
  }

  Widget buildItem(context, Place place) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    // final model = Provider.of<SearchModel>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            FloatingSearchBar.of(context)?.close();
            Future.delayed(
              const Duration(milliseconds: 500),
              () => searchController.clear(),
            );
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
                const SizedBox(width: 16),
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
        if (searchController.suggestions.isNotEmpty &&
            place != searchController.suggestions.last)
          const Divider(height: 0),
      ],
    );
  }
}
