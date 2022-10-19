import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:terrasoft/helpers/color_helper.dart';
import 'package:terrasoft/helpers/widget_helper.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const TabBarMaterialWidget({Key? key, required this.index, required this.onChangedTab,}) : super(key: key);

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTabItem(
                index: 0,
                icon: FontAwesomeIcons.cube,
                text: "Dashboard",
              ),
              buildTabItem(
                index: 1,
                icon: Icons.people_outline,
                text: "Takımlar",
              ),
              buildTabItem(
                index: 2,
                icon: FontAwesomeIcons.binoculars,
                text: "Gözlemciler",
              ),
              buildTabItem(
                index: 3,
                icon: Icons.trending_up,
                text: "Varlıklar",
              ),
              buildTabItem(
                index: 4,
                icon: FontAwesomeIcons.bell,
                text: "Alarmlar",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required IconData icon,
    required String text,
  }) {
    final isSelected = (index == widget.index);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 10),
      child: InkWell(
        onTap: () {
          widget.onChangedTab(index);
        },
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 24,
                color: isSelected ? ColorHelper.primary : ColorHelper.grey,
              ),
              WidgetHelper().space5Height(),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? ColorHelper.primary : ColorHelper.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
      ),
    );
  }
}