class NBATeamStat {
  int? games;
  int? fastBreakPoints;
  int? pointsInPaint;
  int? biggestLead;
  int? secondChancePoints;
  int? pointsOffTurnovers;
  int? longestRun;
  int? points;
  int? fgm;
  int? fga;
  String? fgp;
  int? ftm;
  int? fta;
  String? ftp;
  int? tpm;
  int? tpa;
  String? tpp;
  int? offReb;
  int? defReb;
  int? totReb;
  int? assists;
  int? pFouls;
  int? steals;
  int? turnovers;
  int? blocks;
  int? plusMinus;

  NBATeamStat(
      {this.games,
      this.fastBreakPoints,
      this.pointsInPaint,
      this.biggestLead,
      this.secondChancePoints,
      this.pointsOffTurnovers,
      this.longestRun,
      this.points,
      this.fgm,
      this.fga,
      this.fgp,
      this.ftm,
      this.fta,
      this.ftp,
      this.tpm,
      this.tpa,
      this.tpp,
      this.offReb,
      this.defReb,
      this.totReb,
      this.assists,
      this.pFouls,
      this.steals,
      this.turnovers,
      this.blocks,
      this.plusMinus});

  NBATeamStat.fromJson(Map<String, dynamic> json) {
    games = json['games'];
    fastBreakPoints = json['fastBreakPoints'];
    pointsInPaint = json['pointsInPaint'];
    biggestLead = json['biggestLead'];
    secondChancePoints = json['secondChancePoints'];
    pointsOffTurnovers = json['pointsOffTurnovers'];
    longestRun = json['longestRun'];
    points = json['points'];
    fgm = json['fgm'];
    fga = json['fga'];
    fgp = json['fgp'];
    ftm = json['ftm'];
    fta = json['fta'];
    ftp = json['ftp'];
    tpm = json['tpm'];
    tpa = json['tpa'];
    tpp = json['tpp'];
    offReb = json['offReb'];
    defReb = json['defReb'];
    totReb = json['totReb'];
    assists = json['assists'];
    pFouls = json['pFouls'];
    steals = json['steals'];
    turnovers = json['turnovers'];
    blocks = json['blocks'];
    plusMinus = json['plusMinus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['games'] = this.games;
    data['fastBreakPoints'] = this.fastBreakPoints;
    data['pointsInPaint'] = this.pointsInPaint;
    data['biggestLead'] = this.biggestLead;
    data['secondChancePoints'] = this.secondChancePoints;
    data['pointsOffTurnovers'] = this.pointsOffTurnovers;
    data['longestRun'] = this.longestRun;
    data['points'] = this.points;
    data['fgm'] = this.fgm;
    data['fga'] = this.fga;
    data['fgp'] = this.fgp;
    data['ftm'] = this.ftm;
    data['fta'] = this.fta;
    data['ftp'] = this.ftp;
    data['tpm'] = this.tpm;
    data['tpa'] = this.tpa;
    data['tpp'] = this.tpp;
    data['offReb'] = this.offReb;
    data['defReb'] = this.defReb;
    data['totReb'] = this.totReb;
    data['assists'] = this.assists;
    data['pFouls'] = this.pFouls;
    data['steals'] = this.steals;
    data['turnovers'] = this.turnovers;
    data['blocks'] = this.blocks;
    data['plusMinus'] = this.plusMinus;
    return data;
  }
}
