#!/bin/bash

# Keep two collections and delete everything else from a specific DB

# Variables
DB_URI="mongodb+srv://user:pass@project-mongo-env.afhdjaf.mongodb.net/DbName"
KEEP_COLLECTION_1="collectionName1"
KEEP_COLLECTION_2="collectionName2"

# Get list of all collections in the database, excluding the ones to keep
collections=$(mongosh $DB_URI --quiet --eval "
  db.getCollectionNames().filter(
    name => !['$KEEP_COLLECTION_1', '$KEEP_COLLECTION_2'].includes(name)
  ).join(' ')
")

# Loop through and drop each collection
for collection in $collections; do
  echo "Dropping collection: $collection"
  mongosh $DB_URI --quiet --eval "db.getCollection('$collection').drop()"
done

echo "Completed: All collections except '$KEEP_COLLECTION_1' and '$KEEP_COLLECTION_2' have been dropped."
