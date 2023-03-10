// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetBookRecordCollection on Isar {
  IsarCollection<BookRecord> get bookRecords => this.collection();
}

const BookRecordSchema = CollectionSchema(
  name: r'BookRecord',
  id: 1732420921406462071,
  properties: {
    r'isFinished': PropertySchema(
      id: 0,
      name: r'isFinished',
      type: IsarType.bool,
    ),
    r'lastReadAt': PropertySchema(
      id: 1,
      name: r'lastReadAt',
      type: IsarType.dateTime,
    ),
    r'startedAt': PropertySchema(
      id: 2,
      name: r'startedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _bookRecordEstimateSize,
  serialize: _bookRecordSerialize,
  deserialize: _bookRecordDeserialize,
  deserializeProp: _bookRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'book': LinkSchema(
      id: 3813410768633390665,
      name: r'book',
      target: r'Book',
      single: true,
    ),
    r'currentChapter': LinkSchema(
      id: 4812030242542855523,
      name: r'currentChapter',
      target: r'BookChapterItem',
      single: true,
    ),
    r'readChapters': LinkSchema(
      id: -6005054559010864900,
      name: r'readChapters',
      target: r'BookChapterItem',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _bookRecordGetId,
  getLinks: _bookRecordGetLinks,
  attach: _bookRecordAttach,
  version: '3.0.5',
);

int _bookRecordEstimateSize(
  BookRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bookRecordSerialize(
  BookRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isFinished);
  writer.writeDateTime(offsets[1], object.lastReadAt);
  writer.writeDateTime(offsets[2], object.startedAt);
}

BookRecord _bookRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookRecord();
  object.id = id;
  object.isFinished = reader.readBoolOrNull(offsets[0]);
  object.lastReadAt = reader.readDateTimeOrNull(offsets[1]);
  object.startedAt = reader.readDateTimeOrNull(offsets[2]);
  return object;
}

P _bookRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookRecordGetId(BookRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookRecordGetLinks(BookRecord object) {
  return [object.book, object.currentChapter, object.readChapters];
}

void _bookRecordAttach(IsarCollection<dynamic> col, Id id, BookRecord object) {
  object.id = id;
  object.book.attach(col, col.isar.collection<Book>(), r'book', id);
  object.currentChapter.attach(
      col, col.isar.collection<BookChapterItem>(), r'currentChapter', id);
  object.readChapters
      .attach(col, col.isar.collection<BookChapterItem>(), r'readChapters', id);
}

extension BookRecordQueryWhereSort
    on QueryBuilder<BookRecord, BookRecord, QWhere> {
  QueryBuilder<BookRecord, BookRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BookRecordQueryWhere
    on QueryBuilder<BookRecord, BookRecord, QWhereClause> {
  QueryBuilder<BookRecord, BookRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookRecordQueryFilter
    on QueryBuilder<BookRecord, BookRecord, QFilterCondition> {
  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      isFinishedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFinished',
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      isFinishedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFinished',
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> isFinishedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      lastReadAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastReadAt',
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      lastReadAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastReadAt',
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> lastReadAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReadAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      lastReadAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReadAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      lastReadAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReadAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> lastReadAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReadAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      startedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      startedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> startedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      startedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> startedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> startedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookRecordQueryObject
    on QueryBuilder<BookRecord, BookRecord, QFilterCondition> {}

extension BookRecordQueryLinks
    on QueryBuilder<BookRecord, BookRecord, QFilterCondition> {
  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> book(
      FilterQuery<Book> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'book');
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> bookIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'book', 0, true, 0, true);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> currentChapter(
      FilterQuery<BookChapterItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'currentChapter');
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      currentChapterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'currentChapter', 0, true, 0, true);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition> readChapters(
      FilterQuery<BookChapterItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'readChapters');
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      readChaptersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'readChapters', length, true, length, true);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      readChaptersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'readChapters', 0, true, 0, true);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      readChaptersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'readChapters', 0, false, 999999, true);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      readChaptersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'readChapters', 0, true, length, include);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      readChaptersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'readChapters', length, include, 999999, true);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterFilterCondition>
      readChaptersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'readChapters', lower, includeLower, upper, includeUpper);
    });
  }
}

extension BookRecordQuerySortBy
    on QueryBuilder<BookRecord, BookRecord, QSortBy> {
  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> sortByIsFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.asc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> sortByIsFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.desc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> sortByLastReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadAt', Sort.asc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> sortByLastReadAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadAt', Sort.desc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }
}

extension BookRecordQuerySortThenBy
    on QueryBuilder<BookRecord, BookRecord, QSortThenBy> {
  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> thenByIsFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.asc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> thenByIsFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.desc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> thenByLastReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadAt', Sort.asc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> thenByLastReadAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadAt', Sort.desc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<BookRecord, BookRecord, QAfterSortBy> thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }
}

extension BookRecordQueryWhereDistinct
    on QueryBuilder<BookRecord, BookRecord, QDistinct> {
  QueryBuilder<BookRecord, BookRecord, QDistinct> distinctByIsFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFinished');
    });
  }

  QueryBuilder<BookRecord, BookRecord, QDistinct> distinctByLastReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReadAt');
    });
  }

  QueryBuilder<BookRecord, BookRecord, QDistinct> distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }
}

extension BookRecordQueryProperty
    on QueryBuilder<BookRecord, BookRecord, QQueryProperty> {
  QueryBuilder<BookRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookRecord, bool?, QQueryOperations> isFinishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFinished');
    });
  }

  QueryBuilder<BookRecord, DateTime?, QQueryOperations> lastReadAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReadAt');
    });
  }

  QueryBuilder<BookRecord, DateTime?, QQueryOperations> startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }
}
