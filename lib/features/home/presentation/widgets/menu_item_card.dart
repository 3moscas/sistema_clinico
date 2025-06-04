import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/constants.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    required this.titulo,
    required this.resourceEnum,
    required this.route,
    super.key,
  });

  final String titulo;
  final ImageResourceEnum resourceEnum;
  final String route;

  @override
  Widget build(final BuildContext context) => GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(route);
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      color: tCardBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SvgPicture.asset(
              resourceEnum.path,
              fit: BoxFit.fitWidth,
              // height: 75,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              titulo,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}
