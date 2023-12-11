enum Flavor {
  production,
  development,
  staging,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'QR Scanner';
      case Flavor.development:
        return '[DEV] QR Scanner';
      case Flavor.staging:
        return '[STAG] QR Scanner';
      default:
        return 'title';
    }
  }

}
