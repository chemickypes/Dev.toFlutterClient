import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'articles.g.dart';

@JsonSerializable()
class Article extends Equatable {
  String typeOf;
  int id;
  String title;
  String description;
  String coverImage;
  String publishedAt;
  List<String> tagList;
  String slug;
  String path;
  String url;
  String canonicalUrl;
  int commentsCount;
  int positiveReactionsCount;
  String publishedTimestamp;
  User user;
  Organization organization;

  Article(
      {this.typeOf,
      this.id,
      this.title,
      this.description,
      this.coverImage,
      this.publishedAt,
      this.tagList,
      this.slug,
      this.path,
      this.url,
      this.canonicalUrl,
      this.commentsCount,
      this.positiveReactionsCount,
      this.publishedTimestamp,
      this.user,
      this.organization})
      : super([
          typeOf,
          id,
          title,
          description,
          coverImage,
          publishedAt,
          tagList,
          slug,
          path,
          url,
          canonicalUrl,
          commentsCount,
          positiveReactionsCount,
          publishedTimestamp,
          user,
          organization
        ]);

  Article.fromJsonMap(Map<String, dynamic> json) {
    typeOf = json['type_of'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    coverImage = json['cover_image'];
    publishedAt = json['published_at'];
    tagList = json['tag_list'].cast<String>();
    slug = json['slug'];
    path = json['path'];
    url = json['url'];
    canonicalUrl = json['canonical_url'];
    commentsCount = json['comments_count'];
    positiveReactionsCount = json['positive_reactions_count'];
    publishedTimestamp = json['published_timestamp'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    organization = json['organization'] != null
        ? new Organization.fromJson(json['organization'])
        : null;
  }

  Map<String, dynamic> toJsonMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_of'] = this.typeOf;
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['cover_image'] = this.coverImage;
    data['published_at'] = this.publishedAt;
    data['tag_list'] = this.tagList;
    data['slug'] = this.slug;
    data['path'] = this.path;
    data['url'] = this.url;
    data['canonical_url'] = this.canonicalUrl;
    data['comments_count'] = this.commentsCount;
    data['positive_reactions_count'] = this.positiveReactionsCount;
    data['published_timestamp'] = this.publishedTimestamp;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.organization != null) {
      data['organization'] = this.organization.toJson();
    }
    return data;
  }

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class User extends Equatable {
  String name;
  String username;
  String twitterUsername;
  String githubUsername;
  String websiteUrl;
  String profileImage;
  String profileImage90;

  User(
      {this.name,
      this.username,
      this.twitterUsername,
      this.githubUsername,
      this.websiteUrl,
      this.profileImage,
      this.profileImage90})
      : super([
          name,
          username,
          twitterUsername,
          githubUsername,
          websiteUrl,
          profileImage,
          profileImage90
        ]);

  User.fromJsonMap(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    twitterUsername = json['twitter_username'];
    githubUsername = json['github_username'];
    websiteUrl = json['website_url'];
    profileImage = json['profile_image'];
    profileImage90 = json['profile_image_90'];
  }

  Map<String, dynamic> toJsonMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['twitter_username'] = this.twitterUsername;
    data['github_username'] = this.githubUsername;
    data['website_url'] = this.websiteUrl;
    data['profile_image'] = this.profileImage;
    data['profile_image_90'] = this.profileImage90;
    return data;
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class Organization extends Equatable {
  String name;
  String username;
  String slug;
  String profileImage;
  String profileImage90;

  Organization(
      {this.name,
      this.username,
      this.slug,
      this.profileImage,
      this.profileImage90})
      : super([name, username, slug, profileImage, profileImage90]);

  Organization.fromJsonMap(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    slug = json['slug'];
    profileImage = json['profile_image'];
    profileImage90 = json['profile_image_90'];
  }

  Map<String, dynamic> toJsonMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['slug'] = this.slug;
    data['profile_image'] = this.profileImage;
    data['profile_image_90'] = this.profileImage90;
    return data;
  }

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}
