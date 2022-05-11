part of '../../sign_in.dart';

class PasswordRequirements extends ConsumerWidget {
  const PasswordRequirements({
    this.passwordConfirmation = false,
    required this.passwordHasMinLength,
    required this.passwordHasUppercase,
    required this.passwordHasLowercase,
    required this.passwordHasDigits,
    required this.passwordHasSpecialChars,
    this.passwordsMatch,
    Key? key,
  }) : super(key: key);

  final bool passwordConfirmation;
  final bool passwordHasMinLength;
  final bool passwordHasUppercase;
  final bool passwordHasLowercase;
  final bool passwordHasDigits;
  final bool passwordHasSpecialChars;
  final bool? passwordsMatch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.passwordRequirements,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 5),
            PasswordRequirement(
              label: l10n.passwordRequirementMinLength,
              isValid: passwordHasMinLength,
            ),
            PasswordRequirement(
              label: l10n.passwordRequirementUppercase,
              isValid: passwordHasUppercase,
            ),
            PasswordRequirement(
              label: l10n.passwordRequirementLowercase,
              isValid: passwordHasLowercase,
            ),
            PasswordRequirement(
              label: l10n.passwordRequirementDigits,
              isValid: passwordHasDigits,
            ),
            PasswordRequirement(
              label: l10n.passwordRequirementSpecialChars,
              isValid: passwordHasSpecialChars,
            ),
            if (passwordConfirmation)
              PasswordRequirement(
                label: l10n.passwordRequirementMatch,
                isValid: passwordsMatch ?? false,
              ),
          ],
        ),
      ),
    );
  }
}

class PasswordRequirement extends StatelessWidget {
  const PasswordRequirement({
    Key? key,
    required this.label,
    this.isValid = false,
  }) : super(key: key);

  final bool isValid;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isValid
            ? Icon(
                PlatformIcons.checkmarkFill,
                size: 14,
                color: Colors.green,
              )
            : const Icon(
                CupertinoIcons.circle,
                size: 14,
                color: Colors.grey,
              ),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            color: isValid ? Colors.green : Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
