class AppUtil {
  static String getTimeAgo(DateTime time) {
    var currentTime = DateTime.now().toLocal();
    var timeDifference = currentTime.difference(time);

    if (currentTime.year == time.year) {
      if (timeDifference.inSeconds < 60) {
        return "Now";
      } else if (timeDifference.inMinutes < 60) {
        return '${timeDifference.inMinutes} minute ago';
      } else if (timeDifference.inHours < currentTime.hour + 1) {
        return "Today";
      } else if (timeDifference.inDays > 0) {
        return timeDifference.inDays > 1
            ? "${timeDifference.inDays} days ago"
            : "${timeDifference.inDays} day ago";
      } else {
        return '${getMonthName(time.month)} ${formatIntTxt(time.day)}';
      }
    } else {
      return '${time.year.toString().substring(2)}.${formatIntTxt(time.month)}.${formatIntTxt(time.day)}';
    }
  }

  static String formatIntTxt(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  static String getMonthName(int index) {
    switch (index) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
