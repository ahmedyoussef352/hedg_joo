class Plan {
  final int id;
  final String title;
  final String description;
  final String shortDescription;
  final String videoUrl;
  final String icon;
  final String assetManager;
  final String riskProfile;
  final String subscriptionFreq;
  final String redemptionFreq;
  final String color;
  final int minAmount;
  final int maxAmount;
  final List<Map<String, String>> assetAllocation;

  Plan({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.videoUrl,
    required this.icon,
    required this.assetManager,
    required this.riskProfile,
    required this.subscriptionFreq,
    required this.redemptionFreq,
    required this.minAmount,
    required this.maxAmount,
    required this.color,
    required this.assetAllocation,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    List<Map<String, String>> assetAllocationList = (json['asset_allocation'] as List<dynamic>).map((asset) {
      return {
        'name': asset['name'].toString(),
        'value': asset['value'].toString(),
      };
    }).toList();
    return Plan(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      shortDescription: json['short_description'],
      videoUrl: json['video_url'],
      icon: json['icon'] ?? 'assets/images/default_icon.png', // Default image if null
      assetManager: json['asset_manager'],
      riskProfile: json['risk_profile'],
      subscriptionFreq: json['subscription_freq'],
      redemptionFreq: json['redemption_freq'],
      minAmount: json['min_amount'],
      maxAmount: json['max_amount'],
      color: json['color'],
      assetAllocation: assetAllocationList,
    );
  }
}
