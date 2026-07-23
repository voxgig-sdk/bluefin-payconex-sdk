class BluefinPayconexError extends Error {
  final bool isBluefinPayconexError = true;

  final String sdk = 'BluefinPayconex';

  String code;
  String message;
  dynamic ctx;

  // Populated by makeError with the (cleaned) result and spec.
  dynamic result;
  dynamic spec;

  BluefinPayconexError(this.code, this.message, [this.ctx]);

  @override
  String toString() => 'BluefinPayconexError: ' + code + ': ' + message;
}
