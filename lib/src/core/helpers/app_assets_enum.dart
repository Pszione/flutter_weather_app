enum AppAssetsEnum {
  blueSkyImage('${_pngPath}blue_sky_appbar.jpg'),
  ;

  final String path;
  const AppAssetsEnum(this.path);

  static const _svgPath = 'assets/svg-icons/';
  static const _pngPath = 'assets/images/';
  static const _pdfPath = 'assets/pdf/';
}
