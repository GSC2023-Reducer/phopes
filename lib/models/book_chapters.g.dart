// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_chapters.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetBookChaptersCollection on Isar {
  IsarCollection<BookChapters> get bookChapters => this.collection();
}

const BookChaptersSchema = CollectionSchema(
  name: r'BookChapters',
  id: 6322331398973074595,
  properties: {},
  estimateSize: _bookChaptersEstimateSize,
  serialize: _bookChaptersSerialize,
  deserialize: _bookChaptersDeserialize,
  deserializeProp: _bookChaptersDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'book': LinkSchema(
      id: 8654817493574048980,
      name: r'book',
      target: r'Book',
      single: true,
    ),
    r'chapters': LinkSchema(
      id: 2422851427009926868,
      name: r'chapters',
      target: r'BookChapterItem',
      single: false,
    ),
    r'firstChapter': LinkSchema(
      id: -6790228507070276103,
      name: r'firstChapter',
      target: r'BookChapterItem',
      single: true,
    ),
    r'lastChapter': LinkSchema(
      id: 7371003636343972286,
      name: r'lastChapter',
      target: r'BookChapterItem',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _bookChaptersGetId,
  getLinks: _bookChaptersGetLinks,
  attach: _bookChaptersAttach,
  version: '3.0.5',
);

int _bookChaptersEstimateSize(
  BookChapters object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bookChaptersSerialize(
  BookChapters object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
BookChapters _bookChaptersDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookChapters();
  object.id = id;
  return object;
}

P _bookChaptersDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookChaptersGetId(BookChapters object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookChaptersGetLinks(BookChapters object) {
  return [
    object.book,
    object.chapters,
    object.firstChapter,
    object.lastChapter
  ];
}

void _bookChaptersAttach(
    IsarCollection<dynamic> col, Id id, BookChapters object) {
  object.id = id;
  object.book.attach(col, col.isar.collection<Book>(), r'book', id);
  object.chapters
      .attach(col, col.isar.collection<BookChapterItem>(), r'chapters', id);
  object.firstChapter
      .attach(col, col.isar.collection<BookChapterItem>(), r'firstChapter', id);
  object.lastChapter
      .attach(col, col.isar.collection<BookChapterItem>(), r'lastChapter', id);
}

extension BookChaptersQueryWhereSort
    on QueryBuilder<BookChapters, BookChapters, QWhere> {
  QueryBuilder<BookChapters, BookChapters, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BookChaptersQueryWhere
    on QueryBuilder<BookChapters, BookChapters, QWhereClause> {
  QueryBuilder<BookChapters, BookChapters, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BookChapters, BookChapters, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterWhereClause> idBetween(
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

extension BookChaptersQueryFilter
    on QueryBuilder<BookChapters, BookChapters, QFilterCondition> {
  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition> idBetween(
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

extension BookChaptersQueryObject
    on QueryBuilder<BookChapters, BookChapters, QFilterCondition> {}

extension BookChaptersQueryLinks
    on QueryBuilder<BookChapters, BookChapters, QFilterCondition> {
  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition> book(
      FilterQuery<Book> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'book');
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition> bookIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'book', 0, true, 0, true);
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition> chapters(
      FilterQuery<BookChapterItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'chapters');
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition>
      chaptersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapters', length, true, length, true);
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition>
      chaptersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapters', 0, true, 0, true);
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition>
      chaptersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapters', 0, false, 999999, true);
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition>
      chaptersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapters', 0, true, length, include);
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition>
      chaptersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapters', length, include, 999999, true);
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition>
      chaptersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'chapters', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition> firstChapter(
      FilterQuery<BookChapterItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'firstChapter');
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition>
      firstChapterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'firstChapter', 0, true, 0, true);
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition> lastChapter(
      FilterQuery<BookChapterItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'lastChapter');
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterFilterCondition>
      lastChapterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lastChapter', 0, true, 0, true);
    });
  }
}

extension BookChaptersQuerySortBy
    on QueryBuilder<BookChapters, BookChapters, QSortBy> {}

extension BookChaptersQuerySortThenBy
    on QueryBuilder<BookChapters, BookChapters, QSortThenBy> {
  QueryBuilder<BookChapters, BookChapters, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookChapters, BookChapters, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension BookChaptersQueryWhereDistinct
    on QueryBuilder<BookChapters, BookChapters, QDistinct> {}

extension BookChaptersQueryProperty
    on QueryBuilder<BookChapters, BookChapters, QQueryProperty> {
  QueryBuilder<BookChapters, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
