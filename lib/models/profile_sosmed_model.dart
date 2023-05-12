import 'profile_model.dart';
import 'sosmed_model.dart';

class ProfileSosmedModel {
  ProfileSosmedModel({
    required this.profile,
    required this.listSosmeds,
  });

  final ProfileModel profile;
  final List<SosmedModel> listSosmeds;
}
