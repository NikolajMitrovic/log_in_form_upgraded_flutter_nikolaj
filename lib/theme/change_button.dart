import 'package:flutter/material.dart';
import 'package:log_in_form_flutter/theme/theme.dart';
import 'package:provider/provider.dart';

class ChangeButton extends StatelessWidget {
  const ChangeButton({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      activeColor: Colors.deepPurple,
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
