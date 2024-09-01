import 'package:macros/macros.dart';

/// Checks if the condition is true, used for displaying errors
typedef CheckingFunction = bool Function();

// ignore: public_member_api_docs
extension BuilderExtension on Builder {
  /// A shortcut for [report] with [Severity.error].
  void reportError(String message, {DiagnosticTarget? target}) {
    report(
      Diagnostic(
        DiagnosticMessage(message, target: target),
        Severity.error,
      ),
    );
  }

  /// {%template condition_check_begin}
  /// Checks if `condition` is true; if it is
  /// {%endtemplate}
  /// an error is reported with `message` message.
  /// {%template condition_check_end}
  /// The `target` and `severity` parameters
  /// may help you customize the error
  /// {%endtemplate}
  void assertOrThrowError(
    CheckingFunction condition,
    String message, {
    DiagnosticTarget? target,
    Severity severity = Severity.warning,
    String? correctionMessage,
    List<DiagnosticMessage> contextMessages = const [],
  }) {
    if (condition.call()) {
      throw DiagnosticException(
        Diagnostic(
          DiagnosticMessage(message, target: target),
          severity,
          correctionMessage: correctionMessage,
          contextMessages: contextMessages,
        ),
      );
    }
  }

  /// {%macro condition_check_begin}
  ///
  ///
}
