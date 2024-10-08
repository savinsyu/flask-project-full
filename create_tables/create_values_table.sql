DROP TABLE [values_tbl];

CREATE TABLE IF NOT EXISTS [values_tbl] ( 
  [value_id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [value_name] TEXT NOT NULL,
  [value] REAL NOT NULL
);