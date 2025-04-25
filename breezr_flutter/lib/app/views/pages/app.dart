//
//  breezr_flutter
//  app
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../../../core/models/data/language.dart';
import '../../../core/utils/services.dart';

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
            const Text('Choose your language'),
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
                setState(() {
                  selectedLanguage = value;
                });
              },
              value: selectedLanguage,
              placeholder: const Text('Choose your language'),
              popup: SelectPopup(
                items: SelectItemList(
                  children:
                      Language.values.map((e) {
                        return SelectItemButton(value: e, child: Text(e.name));
                      }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text('Permissions'),
            const SizedBox(height: 8),
            const Text(
              'Breezr needs access to your file system to scan caches and '
              'the Trash folder. macOS will ask you for permission on the next '
              'screen.',
            ),
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
