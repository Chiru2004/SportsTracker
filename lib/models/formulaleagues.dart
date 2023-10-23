class Fobj {
  int? id;
  String? name;
  String? logo;
  String? base;
  int? firstTeamEntry;
  int? worldChampionships;
  HighestRaceFinish? highestRaceFinish;
  int? polePositions;
  int? fastestLaps;
  String? president;
  String? director;
  String? technicalManager;
  String? chassis;
  String? engine;
  String? tyres;

  Fobj(
      {this.id,
      this.name,
      this.logo,
      this.base,
      this.firstTeamEntry,
      this.worldChampionships,
      this.highestRaceFinish,
      this.polePositions,
      this.fastestLaps,
      this.president,
      this.director,
      this.technicalManager,
      this.chassis,
      this.engine,
      this.tyres});

  Fobj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    base = json['base'];
    firstTeamEntry = json['first_team_entry'];
    worldChampionships = json['world_championships'];
    highestRaceFinish = json['highest_race_finish'] != null
        ? new HighestRaceFinish.fromJson(json['highest_race_finish'])
        : null;
    polePositions = json['pole_positions'];
    fastestLaps = json['fastest_laps'];
    president = json['president'];
    director = json['director'];
    technicalManager = json['technical_manager'];
    chassis = json['chassis'];
    engine = json['engine'];
    tyres = json['tyres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['base'] = this.base;
    data['first_team_entry'] = this.firstTeamEntry;
    data['world_championships'] = this.worldChampionships;
    if (this.highestRaceFinish != null) {
      data['highest_race_finish'] = this.highestRaceFinish!.toJson();
    }
    data['pole_positions'] = this.polePositions;
    data['fastest_laps'] = this.fastestLaps;
    data['president'] = this.president;
    data['director'] = this.director;
    data['technical_manager'] = this.technicalManager;
    data['chassis'] = this.chassis;
    data['engine'] = this.engine;
    data['tyres'] = this.tyres;
    return data;
  }
}

class HighestRaceFinish {
  int? position;
  int? number;

  HighestRaceFinish({this.position, this.number});

  HighestRaceFinish.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['number'] = this.number;
    return data;
  }
}