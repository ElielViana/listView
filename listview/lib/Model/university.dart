class University {
  List<String> webPages;
  String country;
  String stateProvince;
  List<String> domains;
  String name;
  String alphaTwoCode;

  University(
      {this.webPages,
      this.country,
      this.stateProvince,
      this.domains,
      this.name,
      this.alphaTwoCode});

  University.fromJson(Map<String, dynamic> json) {
    webPages = json['web_pages'].cast<String>();
    country = json['country'];
    stateProvince = json['state-province'];
    domains = json['domains'].cast<String>();
    name = json['name'];
    alphaTwoCode = json['alpha_two_code'];
  }
}
