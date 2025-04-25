//
//  breezr_flutter
//  app
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../../../core/models/data/language.dart';
import '../../../core/state/locale/locale_bloc.dart';
import '../../../core/utils/services.dart';
import '../../../l10n/l10n.dart';

class BreezrMainApp extends StatefulWidget {
  const BreezrMainApp({super.key});

  @override
  State<BreezrMainApp> createState() => _BreezrMainAppState();
}

class _BreezrMainAppState extends State<BreezrMainApp> {
  Language? selectedLanguage;

  final isSaving = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.onboarding_chooseYourLanguage),
            const SizedBox(height: 16),
            Select<Language>(
              itemBuilder: (context, item) {
                return Text(item.name);
              },
              popupConstraints: const BoxConstraints(
                maxHeight: 300,
                maxWidth: 200,
              ),
              onChanged: (value) {
                if (!(value?.isSupportedByFlutter ?? false)) {
                  log('language not supported by Flutter!');
                  return;
                }

                setState(() {
                  selectedLanguage = value;
                });
                if (value != null) {
                  context.read<LocaleBloc>().add(SwitchLocale(value));
                }
              },
              value: selectedLanguage,
              placeholder: const Text('Choose your language'),
              popup: SelectPopup<Language>(
                items: SelectItemList(
                  children:
                      Language.values.map((e) {
                        return SelectItemButton(value: e, child: Text(e.name));
                      }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              context.l10n.onboarding_permissionsTitle,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(context.l10n.onboarding_permissionsMsg),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onPressed:
                        isSaving.value
                            ? null
                            : () async {
                              isSaving.value = true;
                              $storage.saveToDisk(
                                'preferredLocale',
                                selectedLanguage?.code,
                              );

                              // Navigate to the next onboarding page.
                              if (context.mounted) {}
                            },

                    child:
                        isSaving.value
                            ? const CircularProgressIndicator()
                            : const Text('Continue'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
