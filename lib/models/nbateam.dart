
//model to receive and construct a object instance of the type NBA team.
class NBATeam {
  int? id;
  String? name;
  String? nickname;
  String? code;
  String? city;
  String? logo;
  bool? allStar;
  bool? nbaFranchise;
  Leagues? leagues;

  NBATeam(
      {this.id,
      this.name,
      this.nickname,
      this.code,
      this.city,
      this.logo,
      this.allStar,
      this.nbaFranchise,
      this.leagues});

  NBATeam.fromJson(Map<String, dynamic> json) 
  {
    id = json['id'];
    name = json['name'];
    nickname = json['nickname'];
    code = json['code'];
    city = json['city'];
    logo = json['logo'];
    allStar = json['allStar'];
    nbaFranchise = json['nbaFranchise'];
    leagues =
        json['leagues'] != null ? new Leagues.fromJson(json['leagues']) : null;
  }

  Map<String, dynamic> toJson() 
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['code'] = this.code;
    data['city'] = this.city;
    data['logo'] = this.logo;
    data['allStar'] = this.allStar;
    data['nbaFranchise'] = this.nbaFranchise;
    if (this.leagues != null) {
      data['leagues'] = this.leagues!.toJson();
    }
    return data;
  }
}

class Leagues 
{
  Standard? standard;
  Standard? vegas;
  Standard? utah;
  Standard? sacramento;

  Leagues({this.standard, this.vegas, this.utah, this.sacramento});

  Leagues.fromJson(Map<String, dynamic> json) 
  {
    standard = json['standard'] != null
        ? new Standard.fromJson(json['standard'])
        : null;
    vegas = json['vegas'] != null ? new Standard.fromJson(json['vegas']) : null;
    utah = json['utah'] != null ? new Standard.fromJson(json['utah']) : null;
    sacramento = json['sacramento'] != null
        ? new Standard.fromJson(json['sacramento'])
        : null;
  }

  Map<String, dynamic> toJson() 
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.standard != null) {
      data['standard'] = this.standard!.toJson();
    }
    if (this.vegas != null) {
      data['vegas'] = this.vegas!.toJson();
    }
    if (this.utah != null) {
      data['utah'] = this.utah!.toJson();
    }
    if (this.sacramento != null) {
      data['sacramento'] = this.sacramento!.toJson();
    }
    return data;
  }
}

class Standard 
{
  String? conference;
  String? division;

  Standard({this.conference, this.division});

  Standard.fromJson(Map<String, dynamic> json) {
    conference = json['conference'];
    division = json['division'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conference'] = this.conference;
    data['division'] = this.division;
    return data;
  }
}