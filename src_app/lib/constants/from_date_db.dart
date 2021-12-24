DateTime? fromDateDB(String? date) {
  if (date != null) {
    if (date.endsWith('Z')) {
      return DateTime.parse(date).toLocal();
    } else {
      return DateTime.parse(date + 'Z').toLocal();
    }
  }
}
