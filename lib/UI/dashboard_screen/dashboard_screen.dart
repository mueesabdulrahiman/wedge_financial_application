import 'package:flutter/material.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/line_chart.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/widgets/build_assets_and_liabilities_section.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/widgets/build_assets_section.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/widgets/build_chips.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/widgets/build_liabilities_section.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/widgets/build_netwoth_display_widget.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/widgets/info_card.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/widgets/service_card.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/widgets/carousal_widget.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/widgets/navbar_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F6F8),
      bottomNavigationBar: navbar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildNetWorthDisplayWidget(),
              const SizedBox(height: 16),

              // line Chart
              LineChartWidget(),

              const SizedBox(height: 8),

              // Chips
              buildTabChips(),

              const SizedBox(height: 12),

              // Assets & Liabilities
              buildAssetsAndLiabilitiesSection(),

              const SizedBox(height: 16),

              // Assets Section
              buildAssetsSection(),
              const SizedBox(height: 16),

              // Liabilities Section
              buildLiabilitiesSection(),
              const SizedBox(height: 16),

              // Wealth Forecast Section
              infoCard(
                icon: Icons.trending_up,
                title: 'Forecast Your Financial Future with WealthFlow',
                subtitle:
                    'See how your wealth could grow over time. Wealth flow hepls you forcast future projections based on your assets, assumptions, and inflation trends.',
                buttonText: 'Create Wealth Forecast',
                maxLines: 3
              ),
              const SizedBox(height: 16),

              // Watchlist Section
              infoCard(
                icon: Icons.visibility,
                title: 'Your Watchlist',
                subtitle:
                    'Track stocks, ETFs, crypto, and currencies – all in one place.',
                buttonText: 'Start Tracking',
                maxLines: 2,
              ),
              const SizedBox(height: 16),

              // Services and Vault Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: serviceCard(
                        Icons.call,
                        'Services',
                        'Speak with an expert for help in achieving your goals',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: serviceCard(
                        Icons.lock,
                        'Vault',
                        'Store your documents securely, only you can access them',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Carousel Section
              CarouselWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

