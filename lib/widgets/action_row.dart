import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/home_action.dart';
import '../screens/paywall_screen.dart';

class ActionRow extends ConsumerStatefulWidget {
  final HomeAction action;

  const ActionRow({Key? key, required this.action}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActionRowState();
}

class _ActionRowState extends ConsumerState<ActionRow> {
  final isProMember = false;

  @override
  Widget build(BuildContext context) {
    final lockedForProMembers = widget.action.requiresPro && !isProMember;

    return InkWell(
      onTap: () {
        lockedForProMembers ? context.pushNamed(PaywallScreen.routeName) : context.pushNamed(widget.action.routeName);
      },
      child: Card(
        color: lockedForProMembers ? Colors.grey : widget.action.color,
        margin: const EdgeInsets.all(5).copyWith(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8),
          child: Column(
            children: [
              Text(widget.action.title),
            ],
          ),
        ),
      ),
    );
  }
}
