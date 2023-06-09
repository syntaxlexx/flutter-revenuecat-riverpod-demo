import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/home_action.dart';
import '../screens/paywall_screen.dart';
import '../utils/text_extensions.dart';

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

    return Container(
      margin: const EdgeInsets.all(5).copyWith(bottom: 4),
      child: InkWell(
        onTap: () {
          lockedForProMembers ? context.pushNamed(PaywallScreen.routeName) : context.pushNamed(widget.action.routeName);
        },
        child: Stack(
          children: [
            Card(
              color: lockedForProMembers ? Colors.grey : widget.action.color,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: widget.action.vertical
                    ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: buildContent(),
                        ),
                      )
                    : SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: buildContent(),
                        ),
                      ),
              ),
            ),
            if (lockedForProMembers)
              Positioned(
                right: 20,
                bottom: 20,
                child: Column(
                  children: [
                    const Icon(
                      Icons.lock,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      'PRO',
                      style: context.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildContent() {
    return [
      const Icon(
        Icons.lock,
        size: 20,
        color: Colors.white,
      ),
      const SizedBox(
        height: 5,
        width: 8,
      ),
      Text(
        widget.action.title,
        style: context.bodyLarge?.copyWith(color: Colors.white),
      ),
    ];
  }
}
