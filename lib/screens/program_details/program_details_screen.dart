import 'package:flutter/material.dart';

import 'package:hollythackwray/models/day_model.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final DayModel monday;
  final DayModel tuesday;
  final DayModel wedday;
  final DayModel thursday;
  final DayModel friday;
  final DayModel satday;
  final String description;
  final String title;
  final Widget iconsRow;
  final DayModel sunday;
  const ProgramDetailsScreen({
    Key? key,
    required this.monday,
    required this.tuesday,
    required this.wedday,
    required this.thursday,
    required this.friday,
    required this.satday,
    required this.description,
    required this.title,
    required this.iconsRow,
    required this.sunday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
