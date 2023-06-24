class NotificationModel {
  String arrivalTime;
  String imageUrl;
  String title;
  String body;
  String? formattedNoticeTime;

  NotificationModel({
    required this.arrivalTime,
    required this.imageUrl,
    required this.title,
    required this.body,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      arrivalTime: json['arrivalTime'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'arrivalTime': arrivalTime,
      'imageUrl': imageUrl,
      'title': title,
      'body': body,
    };
  }

  String formatNoticeTime() {
    final currentTime = DateTime.now();
    final notificationTime = DateTime.parse(arrivalTime);
    final difference = currentTime.difference(notificationTime);

    final days = difference.inDays;
    final hours = difference.inHours;
    final minutes = difference.inMinutes;

    if (days > 0) {
      return 'منذ $days ${days == 1 ? "يوم" : "أيام"}';
    } else if (hours > 0) {
      return 'منذ $hours ${hours == 1 ? "ساعة" : "ساعات"}';
    } else if (minutes > 0) {
      return 'منذ $minutes ${minutes == 1 ? "دقيقة" : "دقائق"}';
    } else {
      return 'منذ لحظات';
    }
  }
}
