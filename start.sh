#!/bin/bash
set -x -e

check_file=./.data_imported
import_path=/movies_csv

if [ ! -f ${check_file} ]; then
  echo "Importing the movies database"
  bin/neo4j-import --into data/graph.db/ --nodes:Person ${import_path}/person_node.csv --nodes:Movie ${import_path}/movie_node.csv --nodes:Genre ${import_path}/genre_node.csv --nodes:Keyword ${import_path}/keyword_node.csv --relationships:ACTED_IN ${import_path}/acted_in_rels.csv --relationships:DIRECTED ${import_path}/directed_rels.csv --relationships:HAS_GENRE ${import_path}/has_genre_rels.csv --relationships:HAS_KEYWORD ${import_path}/has_keyword_rels.csv --relationships:PRODUCED ${import_path}/produced_rels.csv --relationships:WRITER_OF /movies_csv/writer_of_rels.csv --delimiter ";" --array-delimiter "|" --id-type INTEGER
  
  touch ${check_file}
  
fi

exec bin/neo4j console