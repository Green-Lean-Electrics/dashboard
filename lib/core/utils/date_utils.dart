class DateUtils {
  static String getTimeAgo(Duration duration) {
    if (duration > Duration(hours: 23)) {
      return duration.inDays.toString() + ' days ago';
    }
    if (duration > Duration(minutes: 59)) {
      return duration.inHours.toString() + ' hours ago';
    }
    if (duration > Duration(seconds: 59)) {
      return duration.inMinutes.toString() + ' minutes ago';
    }

    return duration.inSeconds.toString() + ' seconds ago';
  }
}
