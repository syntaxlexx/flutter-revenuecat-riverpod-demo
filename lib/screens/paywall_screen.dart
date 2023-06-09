import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../utils/utils.dart';

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({Key? key}) : super(key: key);
  static const routeName = 'paywall';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  final List<ProFeatureItem> features = [
    ProFeatureItem(
      title: 'Access to all pro features',
      icon: Icons.key,
      content: 'Upgrade to the premium version of the app and enjoy all the exclusive features available only to pro users.',
    ),
    ProFeatureItem(
      title: 'Helpline 24/7 to Personal Trainers',
      icon: Icons.key,
      content: 'Get unlimited access to our fitness support team and get help anytime you need it - day and night.',
    ),
    ProFeatureItem(
      title: 'Unlock Limited Edition Content',
      icon: Icons.key,
      content: "Unlock exclusive content that you can't get anywhere else, like special workouts and routines.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final revenueCat = ref.watch(revenuecatProvider);
    final size = MediaQuery.of(context).size;

    ref.listen(revenuecatProvider, (prev, next) {
      if (next.isProMember) {
        // navigate to the page. maybe also pass it as a varible in goRouter?
        Navigator.pop(context);
      }
    });

    return Scaffold(
      backgroundColor: Constants.secondaryColor,
      body: LoadingOverlay(
        isLoading: revenueCat.isLoading,
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.1,
              left: 12,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'Back',
                      style: context.bodyLarge?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.15,
                      ),
                      Text(
                        'Upgrade'.toUpperCase(),
                        style: context.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Upgrade to Pro to Access all the Features',
                        style: context.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Icon(
                        MdiIcons.trophyOutline,
                        color: Constants.primaryColor,
                        size: 150,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: features
                            .map((e) => Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  child: Row(children: [
                                    Icon(
                                      e.icon,
                                      size: 40,
                                      color: Constants.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.title,
                                            style: context.titleLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            e.content,
                                            style: context.bodySmall?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // sub buttons
                      getMonthlyButton(revenueCat),
                      getAnnualButton(revenueCat),
                      const SizedBox(
                        height: 14,
                      ),
                      InkWell(
                        onTap: () => ref.read(revenuecatProvider.notifier).restorePurchase(context),
                        child: Text(
                          'Restore Purchases',
                          style: context.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMonthlyButton(RevenuecatState revenueCat) {
    return !revenueCat.hasMonthlyOffering
        ? Container()
        : InkWell(
            onTap: () {
              Package package = revenueCat.offerings!.current!.availablePackages
                  .firstWhere((element) => element.storeProduct.identifier == Constants.proMembershipMonthly);

              ref.read(revenuecatProvider.notifier).purchase(package);
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Constants.primaryColor,
              ),
              child: Center(
                child: revenueCat.hasMonthlyIntroOffering
                    ? Column(
                        children: [
                          Text(
                            'Start a ${revenueCat.monthlyIntroOffering} Free Trial'.toUpperCase(),
                            style: context.bodySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${revenueCat.monthlyOffering}/month after',
                            style: context.bodySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        'Start a ${revenueCat.monthlyOffering}/month subscription',
                        style: context.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          );
  }

  Widget getAnnualButton(RevenuecatState revenueCat) {
    return !revenueCat.hasAnnualOffering
        ? Container()
        : Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Constants.primaryColor,
            ),
            child: Center(
              child: Column(
                children: [
                  revenueCat.hasAnnualIntroOffering
                      ? Column(
                          children: [
                            Text(
                              'Start a ${revenueCat.annualIntroOffering} Free Trial'.toUpperCase(),
                              style: context.bodySmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${revenueCat.annualOffering}/year after',
                              style: context.bodySmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          'Start a ${revenueCat.annualOffering}/year subscription',
                          style: context.bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  Text(
                    'Save ${revenueCat.getAnnualSavings()}% Annually',
                    style: context.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
