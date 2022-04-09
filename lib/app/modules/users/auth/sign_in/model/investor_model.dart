class InvestorModel {
  int? id;
  String? investorName;
  String? email;
  String? city;
  String? country;
  double? balance;
  dynamic? photo;
  Portfolio? portfolio;
  double? portfolioValue;
  bool? firstAccess;
  bool? superAngel;

  InvestorModel(
      {this.id,
      this.investorName,
      this.email,
      this.city,
      this.country,
      this.balance,
      this.photo,
      this.portfolio,
      this.portfolioValue,
      this.firstAccess,
      this.superAngel});

  InvestorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    investorName = json['investor_name'];
    email = json['email'];
    city = json['city'];
    country = json['country'];
    balance = json['balance'];
    photo = json['photo'];
    portfolio = json['portfolio'] != null
        ? new Portfolio.fromJson(json['portfolio'])
        : null;
    portfolioValue = json['portfolio_value'];
    firstAccess = json['first_access'];
    superAngel = json['super_angel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['investor_name'] = this.investorName;
    data['email'] = this.email;
    data['city'] = this.city;
    data['country'] = this.country;
    data['balance'] = this.balance;
    data['photo'] = this.photo;
    if (this.portfolio != null) {
      data['portfolio'] = this.portfolio!.toJson();
    }
    data['portfolio_value'] = this.portfolioValue;
    data['first_access'] = this.firstAccess;
    data['super_angel'] = this.superAngel;
    return data;
  }
}

class Portfolio {
  int? enterprisesNumber;
  List<dynamic>? enterprises;

  Portfolio({this.enterprisesNumber, this.enterprises});

  Portfolio.fromJson(Map<String, dynamic> json) {
    enterprisesNumber = json['enterprises_number'];
    if (json['enterprises'] != null) {
      enterprises = <Null>[];
      json['enterprises'].forEach((v) {
        enterprises!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enterprises_number'] = this.enterprisesNumber;
    if (this.enterprises != null) {
      data['enterprises'] = this.enterprises!.map((v) => v).toList();
    }
    return data;
  }
}
