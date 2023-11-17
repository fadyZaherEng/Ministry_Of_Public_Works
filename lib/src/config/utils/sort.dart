import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/image_paths.dart';

class Sort {
  final int id;
  final String name;
  final String sortColumn;
  final String columnDirection;
  final String imagePath;

  Sort(
    this.id,
    this.name,
    this.sortColumn,
    this.columnDirection,
    this.imagePath,
  );
}

List<Sort> sorts = [
  Sort(
    0,
    S.current.sortAscending,
    "projectName",
    "asc",
    ImagePaths.sortAscending,
  ),
  Sort(
    1,
    S.current.sortDescending,
    "projectName",
    "desc",
    ImagePaths.sortDescending,
  ),
  Sort(
    2,
    S.current.recentlyAdded,
    "creationDate",
    "asc",
    ImagePaths.recentlyAdded,
  ),
  Sort(
    3,
    S.current.oldDate,
    "creationDate",
    "desc",
    ImagePaths.oldDate,
  ),
];
