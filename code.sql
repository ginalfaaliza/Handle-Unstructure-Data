# Get to know the position of '|||' marker
WITH marker AS(
  SELECT 
    Profile,
    STRPOS(Profile,'|||') AS pemisah,
    SPLIT(Profile,'|||') AS split_raw
  FROM `unstructure_data.address`
)
SELECT 
  marker.pemisah,
  (marker.pemisah + 3) + LENGTH(marker.split_raw[SAFE_OFFSET(1)]) AS posisi_2,
  (marker.pemisah + 3) + LENGTH(marker.split_raw[SAFE_OFFSET(1)]) + LENGTH(marker.split_raw[SAFE_OFFSET(2)]) + 3 AS posisi_3
FROM marker
ORDER BY marker.split_raw[SAFE_OFFSET(0)] ASC;


# Exract the data 
WITH split_data AS(
  SELECT SPLIT(Profile,'|||') AS split_raw
  FROM `unstructure_data.address`
)
SELECT 
  split_data.split_raw[SAFE_OFFSET(0)] AS Nama,
  split_data.split_raw[SAFE_OFFSET(1)] AS KotaLahir,
  split_data.split_raw[SAFE_OFFSET(2)] AS TanggalLahir,
  split_data.split_raw[SAFE_OFFSET(3)] AS Provinsi

FROM split_data
ORDER BY 1 ASC;

# Combine KotaLahir and Provinsi using the '-' seperator
WITH combine AS(
  SELECT SPLIT(Profile,'|||') AS split_raw
  FROM `unstructure_data.address`
)
SELECT CONCAT(combine.split_raw[SAFE_OFFSET(1)],' ','-',' ',combine.split_raw[SAFE_OFFSET(3)]) AS TempatLahir
FROM combine;


