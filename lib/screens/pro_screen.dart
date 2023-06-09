import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/providers.dart';
import '../utils/utils.dart';

class ProScreen extends ConsumerStatefulWidget {
  const ProScreen({Key? key}) : super(key: key);
  static const routeName = 'pro';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProScreenState();
}

class _ProScreenState extends ConsumerState<ProScreen> {
  @override
  Widget build(BuildContext context) {
    final revenueCat = ref.watch(revenuecatProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('PRO Side of Life'.toUpperCase()),
      ),
      body: LoadingOverlay(
        isLoading: revenueCat.isLoading,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Icon(
                  MdiIcons.trophyOutline,
                  color: Constants.primaryColor,
                  size: 150,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'PRO'.toUpperCase(),
                  style: context.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Active Subscriptions'.toUpperCase(),
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: revenueCat.customerInfo!.activeSubscriptions
                      .map((e) => ListTile(
                            leading: Icon(
                              MdiIcons.star,
                              color: Constants.primaryColor,
                            ),
                            title: Text(
                              e,
                              style: context.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Active Entitlements'.toUpperCase(),
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: revenueCat.customerInfo!.entitlements.active.entries
                      .map((e) => ListTile(
                            leading: Icon(
                              MdiIcons.star,
                              color: Constants.primaryColor,
                            ),
                            title: Text(
                              e.value.identifier,
                              style: context.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  fromNow(convertToDateTime(e.value.latestPurchaseDate)),
                                  style: context.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  'Ends ${fromNow(convertToDateTime(e.value.expirationDate))}',
                                  style: context.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'All Offerings'.toUpperCase(),
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: revenueCat.offerings!.all.entries
                      .map((e) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text(
                                      e.key.toUpperCase(),
                                      style: context.titleSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Column(
                                      children: e.value.availablePackages
                                          .map(
                                            (f) => ListTile(
                                              leading: Icon(
                                                MdiIcons.star,
                                                color: Constants.primaryColor,
                                              ),
                                              title: Text(
                                                f.storeProduct.identifier,
                                                style: context.titleMedium?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    f.storeProduct.title,
                                                    style: context.bodySmall?.copyWith(
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${f.storeProduct.priceString}/${f.storeProduct.defaultOption?.billingPeriod?.unit.name}',
                                                    style: context.bodySmall?.copyWith(
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
