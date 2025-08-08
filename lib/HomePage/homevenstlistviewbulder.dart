import 'package:flutter/material.dart';

import 'package:proj1/Data/eventformat.dart';
import 'package:proj1/Data/dineindatafromat.dart';
import 'package:proj1/EventsPage/eventspage.dart';
import 'homepagemaincard.dart';
import 'homeoagerestcard.dart';

class HomepageListViewBuilder extends StatelessWidget {
  final List<dynamic> items;
  final Widget Function(dynamic item) cardBuilder;
  final void Function(dynamic item)? onTap;

  const HomepageListViewBuilder({
    super.key,
    required this.items,
    required this.cardBuilder,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: onTap != null ? () => onTap!(item) : null,
          child: cardBuilder(item),
        );
      },
    );
  }
}
