-- Database: h2
-- Change Parameter: existingColumnName=state
-- Change Parameter: existingTableName=address
-- Change Parameter: newColumnDataType=char(2)
-- Change Parameter: newColumnName=abbreviation
-- Change Parameter: newTableName=state
CREATE TABLE state AS SELECT DISTINCT state AS abbreviation FROM address WHERE state IS NOT NULL;
ALTER TABLE state ALTER COLUMN  abbreviation CHAR(2) NOT NULL;
ALTER TABLE state ADD PRIMARY KEY (abbreviation);
ALTER TABLE address ADD CONSTRAINT FK_ADDRESS_STATE FOREIGN KEY (state) REFERENCES state (abbreviation);
