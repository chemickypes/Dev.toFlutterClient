// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    typeOf: json['typeOf'] as String,
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    coverImage: json['coverImage'] as String,
    publishedAt: json['publishedAt'] as String,
    tagList: (json['tagList'] as List)?.map((e) => e as String)?.toList(),
    slug: json['slug'] as String,
    path: json['path'] as String,
    url: json['url'] as String,
    canonicalUrl: json['canonicalUrl'] as String,
    commentsCount: json['commentsCount'] as int,
    positiveReactionsCount: json['positiveReactionsCount'] as int,
    publishedTimestamp: json['publishedTimestamp'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    organization: json['organization'] == null
        ? null
        : Organization.fromJson(json['organization'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'typeOf': instance.typeOf,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'publishedAt': instance.publishedAt,
      'tagList': instance.tagList,
      'slug': instance.slug,
      'path': instance.path,
      'url': instance.url,
      'canonicalUrl': instance.canonicalUrl,
      'commentsCount': instance.commentsCount,
      'positiveReactionsCount': instance.positiveReactionsCount,
      'publishedTimestamp': instance.publishedTimestamp,
      'user': instance.user,
      'organization': instance.organization,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    username: json['username'] as String,
    twitterUsername: json['twitterUsername'] as String,
    githubUsername: json['githubUsername'] as String,
    websiteUrl: json['websiteUrl'] as String,
    profileImage: json['profileImage'] as String,
    profileImage90: json['profileImage90'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'twitterUsername': instance.twitterUsername,
      'githubUsername': instance.githubUsername,
      'websiteUrl': instance.websiteUrl,
      'profileImage': instance.profileImage,
      'profileImage90': instance.profileImage90,
    };

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    name: json['name'] as String,
    username: json['username'] as String,
    slug: json['slug'] as String,
    profileImage: json['profileImage'] as String,
    profileImage90: json['profileImage90'] as String,
  );
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'slug': instance.slug,
      'profileImage': instance.profileImage,
      'profileImage90': instance.profileImage90,
    };
