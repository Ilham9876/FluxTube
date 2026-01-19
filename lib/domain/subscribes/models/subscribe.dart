// ignore_for_file: public_member_api_docs, sort_constructors_first

//--------SUBSCRIBE MODEL FOR LOCAL SAVING--------//
// Domain model for channel subscriptions

class Subscribe {
  late String id;
  late String channelName;
  late bool? isVerified;
  String? avatarUrl;
  String profileName;

  Subscribe({
    required this.id,
    required this.channelName,
    this.isVerified,
    this.avatarUrl,
    this.profileName = 'default',
  });
}
