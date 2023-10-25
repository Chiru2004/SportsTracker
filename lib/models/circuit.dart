
//model to receive the Circuit details of Formula1 from the API
class Circuit {

  int? id;
  String? name;
  String? image;
  Competition? competition;
  int? firstGrandPrix;
  int? laps;
  String? length;
  String? raceDistance;
  LapRecord? lapRecord;
  int? capacity;
  int? opened;
 
  Circuit(
      {this.id,
      this.name,
      this.image,
      this.competition,
      this.firstGrandPrix,
      this.laps,
      this.length,
      this.raceDistance,
      this.lapRecord,
      this.capacity,
      this.opened,
      });

  Circuit.fromJson(Map<String, dynamic> json) { // to convert Map into a Circuit instance
    id = json['id'];
    name = json['name'];
    image = json['image'];
    competition = json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null;
    firstGrandPrix = json['first_grand_prix'];
    laps = json['laps'];
    length = json['length'];
    raceDistance = json['race_distance'];
    lapRecord = json['lap_record'] != null
        ? new LapRecord.fromJson(json['lap_record'])
        : null;
    capacity = json['capacity'];
    opened = json['opened'];
   
  }

  Map<String, dynamic> toJson() {                   //function to convert circuit instance into a map
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.competition != null) {
      data['competition'] = this.competition!.toJson();
    }
    data['first_grand_prix'] = this.firstGrandPrix;
    data['laps'] = this.laps;
    data['length'] = this.length;
    data['race_distance'] = this.raceDistance;
    if (this.lapRecord != null) {
      data['lap_record'] = this.lapRecord!.toJson();
    }
    data['capacity'] = this.capacity;
    data['opened'] = this.opened;
    
    return data;
  }
}

class Competition {               // to convert Map into a Comeptition instance, here Competition is a class within the circuits class.
  int? id;
  String? name;
  Location? location;

  Competition({this.id, this.name, this.location});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {                     //Location class inside the Circuit class
  String? country;
  String? city;

  Location({this.country, this.city});

  Location.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}

class LapRecord {
  String? time;
  String? driver;
  String? year;

  LapRecord({this.time, this.driver, this.year});

  LapRecord.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    driver = json['driver'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['driver'] = this.driver;
    data['year'] = this.year;
    return data;
  }
}
