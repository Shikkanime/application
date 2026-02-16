enum ImageType {
  thumbnail(value: 'THUMBNAIL'),
  banner(value: 'BANNER'),
  carousel(value: 'CAROUSEL'),
  memberProfile(value: 'MEMBER_PROFILE');

  const ImageType({required this.value});

  final String value;
}
