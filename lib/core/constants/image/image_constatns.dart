class ImageConstants {
  ImageConstants._init();
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  String get logo => toPng('veli');

  String get hotDog => toPng('hotdogs');
  String get projeIcon => toJpeg('logo-thpt');
  String get booksIcon => toPng('books');
  String get feedbackIcon => toPng('feedback');

  String toPng(String name) => 'asset/image/$name.png';
  String toJpeg(String name) => 'asset/image/$name.jpeg';
}
