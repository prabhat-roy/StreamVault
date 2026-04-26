// Catalogue collection — rich nested metadata for VOD titles
db.createCollection("title", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["_id", "type", "title", "languages", "release_date"],
      properties: {
        _id:           { bsonType: "string" },
        type:          { enum: ["movie","episode","season","series","short","live"] },
        title:         { bsonType: "string" },
        synopsis:      { bsonType: "string" },
        languages:     { bsonType: "array", items: { bsonType: "string" } },
        subtitles:     { bsonType: "array", items: { bsonType: "string" } },
        rating:        { bsonType: "object" },
        cast:          { bsonType: "array" },
        crew:          { bsonType: "array" },
        posters:       { bsonType: "object" },
        trailers:      { bsonType: "array" },
        rights:        { bsonType: "object" },
        release_date:  { bsonType: "date" },
        duration_ms:   { bsonType: "long" },
        drm_systems:   { bsonType: "array", items: { enum: ["WIDEVINE","FAIRPLAY","PLAYREADY"] } }
      }
    }
  }
});
db.title.createIndex({ type: 1, release_date: -1 });
db.title.createIndex({ "rights.region": 1 });
db.title.createIndex({ title: "text", synopsis: "text" });
