enum ImageType {
  thumbnail(value: 'THUMBNAIL'),
  banner(value: 'BANNER'),
  memberProfile(value: 'MEMBER_PROFILE');

  const ImageType({required this.value});

  final String value;
}
