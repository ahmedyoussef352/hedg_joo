
class UserProfile {
    UserProfile({
        this.code,
        this.status,
        this.data,
        this.message,
    });

    int? code;
    bool? status;
    UserProfileData? data;
    String? message;

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        code: json["code"],
        status: json["status"],
        data: UserProfileData.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data?.toJson(),
        "message": message,
    };
}

class UserProfileData {
    UserProfileData({
        this.id,
        this.token,
        this.pushToken,
        this.name,
        this.phone,
        this.email,
        this.isActive,
        this.isSupplier,
        this.isSocial,
        this.providerId,
        this.providerName,
        this.hasVerifiedHisAccount = false
    });

    int? id;
    String? token;
    String? pushToken;
    String? name;
    String? phone;
    String? email;
    bool? isActive;
    bool? isSupplier;
    bool? isSocial;
    String? providerId;
    String? providerName;
    bool? hasVerifiedHisAccount;

    factory UserProfileData.fromJson(Map<String, dynamic> json) => UserProfileData(
        id: json["id"],
        token: json["token"],
        pushToken: json["push_token"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        isActive: json["is_active"],
        isSupplier: json["is_supplier"],
        isSocial: json["is_social"],
        providerId: json["provider_id"],
        providerName: json["provider_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "push_token": pushToken,
        "name": name,
        "phone": phone,
        "email": email,
        "is_active": isActive,
        "is_supplier": isSupplier,
        "is_social": isSocial,
        "provider_id": providerId,
        "provider_name": providerName,
    };
}
