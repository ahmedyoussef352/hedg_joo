// class VerifiedNationalId {
//   BackIdFace? back;
//   double? backLiveness;
//   FrontIdFace? front;
//   double? frontLiveness;
//   String? next;
//   String? msg;
//   // String? imageUrl;
//   String? token;

//   VerifiedNationalId(
//       {this.frontLiveness,
//       this.backLiveness,
//       this.msg,
//       this.next,
//       this.token,
//       this.front,
//       this.back});

//   factory VerifiedNationalId.fromJson(Map<String, dynamic> json) {
//     // print(json["front"]);
//     return VerifiedNationalId(
//         backLiveness: json["back_liveness"],
//         frontLiveness: json["front_liveness"],
//         msg: json["msg"],
//         front: FrontIdFace.fromJson(json["front"]),
//         back: BackIdFace.fromJson(json["back"]),
//         next: json["next"],
//         token: json["token"]);
//   }
//   Map<String, dynamic> toJson() => {
//         "back_liveness": backLiveness,
//         "front_liveness": backLiveness,
//         "front": front?.toJson(),
//         "back": back?.toJson(),
//         "msg": msg,
//         "next": next,
//         "token": token,
//       };
// }

// class FrontIdFace {
//   String? address;
//   String? addressDetails;
//   String? birthDate;
//   String? district;
//   String? faceImage;
//   String? governorate;
//   String? familyName;
//   String? name;
//   String? nationalId;
//   String? serial;
//   String? street;
//   String? subdistrict;
//   FrontIdFace({
//     address,
//     addressDetails,
//     birthDate,
//     district,
//     governorate,
//     familyName,
//     name,
//     faceImage,
//     nationalId,
//     serial,
//     street,
//     subdistrict,
//   });

//   factory FrontIdFace.fromJson(Map<String, dynamic> json) => FrontIdFace(
//       address: json["address"],
//       addressDetails: json["address_details"],
//       birthDate: json["birth_date"],
//       district: json["district"],
//       governorate: json["governorate"],
//       familyName: json["family_name"],
//       faceImage: json["face_image"],
//       name: json["name"],
//       nationalId: json["national_id"],
//       serial: json["serial"],
//       street: json["street"],
//       subdistrict: json["subdistrict"]);
//   Map<String, dynamic> toJson() => {
//         "address": address,
//         "address_details": addressDetails,
//         "birth_date": birthDate,
//         "district": district,
//         "governorate": governorate,
//         "family_name": familyName,
//         "face_image": faceImage,
//         "name": name,
//         "national_id": nationalId,
//         "serial": serial,
//         "street": street,
//         "subdistrict": subdistrict
//       };
// }

// class BackIdFace {
//   String? husband;
//   String? expiration;
//   bool? isExpired;
//   String? issueDate;
//   String? jobPlace;
//   String? jobTitle;
//   String? marital;

//   int? nationalId;
//   String? serial;
//   String? religion;
//   String? sex;
//   BackIdFace({
//     husband,
//     expiration,
//     isExpired,
//     issueDate,
//     jobPlace,
//     jobTitle,
//     marital,
//     nationalId,
//     serial,
//     religion,
//     sex,
//   });

//      factory BackIdFace.fromJson(Map<String, dynamic> json) => BackIdFace(
//         husband: json["Husband"],
//         expiration: json["expiration"],
//         isExpired: json["isExpired"],
//         issueDate: json["issue_date"],
//         jobPlace: json["job_place"],
//         jobTitle: json["job_title"],
//         marital: json["marital"],
//         nationalId: json["national_id"],
//         religion: json["religion"],
//         sex: json["sex"],
//     );

//     Map<String, dynamic> toJson() => {
//         "Husband": husband,
//         "expiration": expiration,
//         "isExpired": isExpired,
//         "issue_date": issueDate,
//         "job_place": jobPlace,
//         "job_title": jobTitle,
//         "marital": marital,
//         "national_id": nationalId,
//         "religion": religion,
//         "sex": sex,
//     };
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class VerifiedNationalId {
  String? msg;
  String? next;
  int? overallStatus;
  int? result;
  bool? shouldTerminate;
  Front? front;
  Back? back;

  VerifiedNationalId(
      {this.msg,
      this.next,
      this.overallStatus,
      this.result,
      this.shouldTerminate,
      this.front,
      this.back});

  VerifiedNationalId.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    next = json['next'];
    overallStatus = json['overall_status'];
    result = json['result'];
    shouldTerminate = json['should_terminate'];
    front = json['front'] != null ? Front.fromJson(json['front']) : null;
    back = json['back'] != null ? Back.fromJson(json['back']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    data['next'] = next;
    data['overall_status'] = overallStatus;
    data['result'] = result;
    data['should_terminate'] = shouldTerminate;
    if (front != null) {
      data['front'] = front!.toJson();
    }
    if (back != null) {
      data['back'] = back!.toJson();
    }
    return data;
  }
}

class Front {
  String? name;
  String? familyName;
  int? nationalId;
  String? address;
  String? addressDetails;
  String? street;
  String? subdistrict;
  String? district;
  String? governorate;
  String? serial;
  String? birthdate;
  String? faceImage;
  String? image;

  Front(
      {this.name,
      this.familyName,
      this.nationalId,
      this.address,
      this.addressDetails,
      this.street,
      this.subdistrict,
      this.district,
      this.governorate,
      this.serial,
      this.birthdate,
      this.faceImage,
      this.image});

  Front.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    familyName = json['family_name'];
    nationalId = json['national_id'];
    address = json['address'];
    addressDetails = json['address_details'];
    street = json['street'];
    subdistrict = json['subdistrict'];
    district = json['district'];
    governorate = json['governorate'];
    serial = json['serial'];
    birthdate = json['birthdate'];
    faceImage = json['face_image'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['family_name'] = familyName;
    data['national_id'] = nationalId;
    data['address'] = address;
    data['address_details'] = addressDetails;
    data['street'] = street;
    data['subdistrict'] = subdistrict;
    data['district'] = district;
    data['governorate'] = governorate;
    data['serial'] = serial;
    data['birthdate'] = birthdate;
    data['face_image'] = faceImage;
    data['image'] = image;
    return data;
  }
}

class Back {
  int? nationalId;
  String? expiration;
  bool? isExpired;
  String? jobTitle;
  String? jobPlace;
  String? marital;
  String? religion;
  String? sex;
  String? husband;
  String? image;

  Back(
      {this.nationalId,
      this.expiration,
      this.isExpired,
      this.jobTitle,
      this.jobPlace,
      this.marital,
      this.religion,
      this.sex,
      this.husband,
      this.image});

  Back.fromJson(Map<String, dynamic> json) {
    nationalId = json['national_id'];
    expiration = json['expiration'];
    isExpired = json['isExpired'];
    jobTitle = json['job_title'];
    jobPlace = json['job_place'];
    marital = json['marital'];
    religion = json['religion'];
    sex = json['sex'];
    husband = json['Husband'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['national_id'] = nationalId;
    data['expiration'] = expiration;
    data['isExpired'] = isExpired;
    data['job_title'] = jobTitle;
    data['job_place'] = jobPlace;
    data['marital'] = marital;
    data['religion'] = religion;
    data['sex'] = sex;
    data['Husband'] = husband;
    data['image'] = image;
    return data;
  }
}
