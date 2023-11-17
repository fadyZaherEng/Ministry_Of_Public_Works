import 'package:aim/generated/l10n.dart';

String priorityName(double priority) {
  if (priority == 1.0) {
    return S.current.low;
  } else if (priority == 2.0) {
    return S.current.medium;
  } else if (priority == 3.0) {
    return S.current.high;
  } else {
    return priority.toString();
  }
}