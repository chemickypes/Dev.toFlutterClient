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
    coverImage: json['cover_image'] as String,
    publishedAt: json['publishedAt'] as String,
    tagList: (json['tag_list'] as List)?.map((e) => e as String)?.toList(),
    slug: json['slug'] as String,
    path: json['path'] as String,
    url: json['url'] as String,
    canonicalUrl: json['canonical_url'] as String,
    commentsCount: json['comments_count'] as int,
    positiveReactionsCount: json['positive_reactions_count'] as int,
    publishedTimestamp: json['published_timestamp'] as String,
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
      'cover_image': instance.coverImage,
      'publishedAt': instance.publishedAt,
      'tag_list': instance.tagList,
      'slug': instance.slug,
      'path': instance.path,
      'url': instance.url,
      'canonical_url': instance.canonicalUrl,
      'comments_count': instance.commentsCount,
      'positive_reactions_count': instance.positiveReactionsCount,
      'published_timestamp': instance.publishedTimestamp,
      'user': instance.user,
      'organization': instance.organization,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    username: json['username'] as String,
    twitterUsername: json['twitter_username'] as String,
    githubUsername: json['github_username'] as String,
    websiteUrl: json['website_url'] as String,
    profileImage: json['profile_image'] as String,
    profileImage90: json['profile_image_90'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'twitter_username': instance.twitterUsername,
      'github_username': instance.githubUsername,
      'website_url': instance.websiteUrl,
      'profile_image': instance.profileImage,
      'profile_image_90': instance.profileImage90,
    };

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    name: json['name'] as String,
    username: json['username'] as String,
    slug: json['slug'] as String,
    profileImage: json['profile_image'] as String,
    profileImage90: json['profile_image_90'] as String,
  );
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'slug': instance.slug,
      'profile_image': instance.profileImage,
      'profile_image_90': instance.profileImage90,
    };
