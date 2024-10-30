#!/bin/bash

# Delete all documents from a db except the matched key: value pairs

# Variables
DB_NAME="dbName"
COLLECTION_NAME="collectionName"
MONGO_URI="mongodb+srv://user:pass@project-mongo-env.afhdjaf.mongodb.net/$DB_NAME?retryWrites=true&w=majority"

# MongoDB query to delete all documents that do not match { key1: value1, key2: value2 }
mongosh "$MONGO_URI" --quiet --eval "
  db.getCollection('$COLLECTION_NAME').deleteMany({
    \$nor: [
      { key: '6997829C--AADA' },
      { key: '6886829C--AADA' }
    ]
  });
"

echo "Deletion complete: All documents except those with 'key:6997829C--AADA' and 'key:6886829C--AADA' have been removed from '$COLLECTION_NAME'."
