import 'package:flutter/material.dart';
import 'package:test_task/core/theme/text_theme.dart';
import 'package:test_task/modules/dashboard/local_widgets/account_options_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Muhammad Binyameen",
                        style: TextStyles.h2!.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "chaudharybinyameen@gmail.com",
                        style: TextStyles.bodyText!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "07XXXXXXXX",
                        style: TextStyles.bodyText!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Options
            const AccountOption(
              icon: Icons.settings,
              label: 'Kontoinställningar',
            ),
            const AccountOption(
              icon: Icons.credit_card,
              label: 'Mina betalmetoder',
            ),
            const AccountOption(
              icon: Icons.sports_soccer, // Or Icons.support_agent
              label: 'Support',
            ),
          ],
        ),
      ),
    );
  }
}
