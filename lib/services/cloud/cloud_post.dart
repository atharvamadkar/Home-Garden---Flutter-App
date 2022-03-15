import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:home_garden/services/cloud/cloud_constants.dart';

@immutable
class CloudPost {
  final String postId;
  final String userId;
  final String commonName;
  final List<String>? tags;
  final List<String>? physicalDescription;
  final List<String>? environmentBenefits;
  final List<String>? humanBenefits;
  final List<String>? photos;
  final List<String>? link;
  final DateTime dateTime;
  const CloudPost({
    required this.postId,
    required this.userId,
    required this.commonName,
    this.tags,
    this.physicalDescription,
    this.environmentBenefits,
    this.humanBenefits,
    this.photos,
    this.link,
    required this.dateTime,
  });

  CloudPost.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : postId = snapshot.id,
        userId = snapshot.data()[userIdFieldName],
        commonName = snapshot.data()[commonNameFieldName],
        tags = snapshot.data()[tagsFieldName] ?? [],
        physicalDescription =
            snapshot.data()[physicalDescriptionFieldName] ?? [],
        environmentBenefits =
            snapshot.data()[environmentalBenefitsFieldName] ?? [],
        humanBenefits = snapshot.data()[humanBenefitsFieldName] ?? [],
        photos = snapshot.data()[photosFieldName] ?? [],
        link = snapshot.data()[linksFieldName] ?? [],
        dateTime = snapshot.data()[dateFieldName];
}
