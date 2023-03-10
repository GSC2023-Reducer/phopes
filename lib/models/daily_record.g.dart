// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDailyRecordCollection on Isar {
  IsarCollection<DailyRecord> get dailyRecords => this.collection();
}

const DailyRecordSchema = CollectionSchema(
  name: r'DailyRecord',
  id: -1016922496390167466,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _dailyRecordEstimateSize,
  serialize: _dailyRecordSerialize,
  deserialize: _dailyRecordDeserialize,
  deserializeProp: _dailyRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'chaptersRead': LinkSchema(
      id: -8478358371522955021,
      name: r'chaptersRead',
      target: r'BookChapterItem',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _dailyRecordGetId,
  getLinks: _dailyRecordGetLinks,
  attach: _dailyRecordAttach,
  version: '3.0.5',
);

int _dailyRecordEstimateSize(
  DailyRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dailyRecordSerialize(
  DailyRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
}

DailyRecord _dailyRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyRecord();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  return object;
}

P _dailyRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyRecordGetId(DailyRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyRecordGetLinks(DailyRecord object) {
  return [object.chaptersRead];
}

void _dailyRecordAttach(
    IsarCollection<dynamic> col, Id id, DailyRecord object) {
  object.id = id;
  object.chaptersRead
      .attach(col, col.isar.collection<BookChapterItem>(), r'chaptersRead', id);
}

extension DailyRecordQueryWhereSort
    on QueryBuilder<DailyRecord, DailyRecord, QWhere> {
  QueryBuilder<DailyRecord, DailyRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DailyRecordQueryWhere
    on QueryBuilder<DailyRecord, DailyRecord, QWhereClause> {
  QueryBuilder<DailyRecord, DailyRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<DailyRecord, DailyRecord, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterWhereClause> idBetween(
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

extension DailyRecordQueryFilter
    on QueryBuilder<DailyRecord, DailyRecord, QFilterCondition> {
  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> idBetween(
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
}

extension DailyRecordQueryObject
    on QueryBuilder<DailyRecord, DailyRecord, QFilterCondition> {}

extension DailyRecordQueryLinks
    on QueryBuilder<DailyRecord, DailyRecord, QFilterCondition> {
  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> chaptersRead(
      FilterQuery<BookChapterItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'chaptersRead');
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      chaptersReadLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chaptersRead', length, true, length, true);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      chaptersReadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chaptersRead', 0, true, 0, true);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      chaptersReadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chaptersRead', 0, false, 999999, true);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      chaptersReadLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chaptersRead', 0, true, length, include);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      chaptersReadLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chaptersRead', length, include, 999999, true);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      chaptersReadLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'chaptersRead', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DailyRecordQuerySortBy
    on QueryBuilder<DailyRecord, DailyRecord, QSortBy> {
  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }
}

extension DailyRecordQuerySortThenBy
    on QueryBuilder<DailyRecord, DailyRecord, QSortThenBy> {
  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension DailyRecordQueryWhereDistinct
    on QueryBuilder<DailyRecord, DailyRecord, QDistinct> {
  QueryBuilder<DailyRecord, DailyRecord, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }
}

extension DailyRecordQueryProperty
    on QueryBuilder<DailyRecord, DailyRecord, QQueryProperty> {
  QueryBuilder<DailyRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyRecord, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }
}
