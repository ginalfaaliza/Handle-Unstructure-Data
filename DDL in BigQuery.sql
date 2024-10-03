# SETTING DATA DUMMY (unstructure_data)
## menghapus kolom kosong
CREATE OR REPLACE TABLE `unstructure_data.address` AS SELECT string_field_0 FROM `unstructure_data.address`;

## mengubah nama kolom menjadi address
CREATE OR REPLACE TABLE `unstructure_data.address` AS SELECT string_field_0 AS Alamat FROM `unstructure_data.address`;
CREATE OR REPLACE TABLE `unstructure_data.address` AS SELECT Alamat AS Profile FROM `unstructure_data.address`;
