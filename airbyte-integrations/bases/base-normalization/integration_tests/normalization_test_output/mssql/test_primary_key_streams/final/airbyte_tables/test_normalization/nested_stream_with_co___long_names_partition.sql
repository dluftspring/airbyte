
   
  USE [test_normalization];
  if object_id ('test_normalization."nested_stream_with_co___long_names_partition__dbt_tmp_temp_view"','V') is not null
      begin
      drop view test_normalization."nested_stream_with_co___long_names_partition__dbt_tmp_temp_view"
      end


   
   
  USE [test_normalization];
  if object_id ('test_normalization."nested_stream_with_co___long_names_partition__dbt_tmp"','U') is not null
      begin
      drop table test_normalization."nested_stream_with_co___long_names_partition__dbt_tmp"
      end


   USE [test_normalization];
   EXEC('create view test_normalization."nested_stream_with_co___long_names_partition__dbt_tmp_temp_view" as
    
with __dbt__CTE__nested_stream_with_co___long_names_partition_ab1 as (

-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_nested_strea__nto_long_names_hashid,
    json_query("partition", ''$."double_array_data"'') as double_array_data,
    json_query("partition", ''$."DATA"'') as "DATA",
    json_query("partition", ''$."column`_''''with\"_quotes"'') as "column`_''with""_quotes",
    _airbyte_emitted_at
from "test_normalization".test_normalization."nested_stream_with_co__lting_into_long_names" as table_alias
where "partition" is not null
-- partition at nested_stream_with_complex_columns_resulting_into_long_names/partition
),  __dbt__CTE__nested_stream_with_co___long_names_partition_ab2 as (

-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_nested_strea__nto_long_names_hashid,
    double_array_data,
    "DATA",
    "column`_''with""_quotes",
    _airbyte_emitted_at
from __dbt__CTE__nested_stream_with_co___long_names_partition_ab1
-- partition at nested_stream_with_complex_columns_resulting_into_long_names/partition
),  __dbt__CTE__nested_stream_with_co___long_names_partition_ab3 as (

-- SQL model to build a hash column based on the values of this record
select
    convert(varchar(32), HashBytes(''md5'',  coalesce(cast(
    
    

    concat(concat(coalesce(cast(_airbyte_nested_strea__nto_long_names_hashid as 
    VARCHAR(max)), ''''), ''-'', coalesce(cast(cast(double_array_data as 
    VARCHAR(max)) as 
    VARCHAR(max)), ''''), ''-'', coalesce(cast(cast("DATA" as 
    VARCHAR(max)) as 
    VARCHAR(max)), ''''), ''-'', coalesce(cast(cast("column`_''with""_quotes" as 
    VARCHAR(max)) as 
    VARCHAR(max)), ''''),''''), '''') as 
    VARCHAR(max)), '''')), 2) as _airbyte_partition_hashid,
    tmp.*
from __dbt__CTE__nested_stream_with_co___long_names_partition_ab2 tmp
-- partition at nested_stream_with_complex_columns_resulting_into_long_names/partition
)-- Final base SQL model
select
    _airbyte_nested_strea__nto_long_names_hashid,
    double_array_data,
    "DATA",
    "column`_''with""_quotes",
    _airbyte_emitted_at,
    _airbyte_partition_hashid
from __dbt__CTE__nested_stream_with_co___long_names_partition_ab3
-- partition at nested_stream_with_complex_columns_resulting_into_long_names/partition from "test_normalization".test_normalization."nested_stream_with_co__lting_into_long_names"
    ');

   SELECT * INTO "test_normalization".test_normalization."nested_stream_with_co___long_names_partition__dbt_tmp" FROM
    "test_normalization".test_normalization."nested_stream_with_co___long_names_partition__dbt_tmp_temp_view"

   
   
  USE [test_normalization];
  if object_id ('test_normalization."nested_stream_with_co___long_names_partition__dbt_tmp_temp_view"','V') is not null
      begin
      drop view test_normalization."nested_stream_with_co___long_names_partition__dbt_tmp_temp_view"
      end

    
   use [test_normalization];
  if EXISTS (
        SELECT * FROM
        sys.indexes WHERE name = 'test_normalization_nested_stream_with_co___long_names_partition__dbt_tmp_cci'
        AND object_id=object_id('test_normalization_nested_stream_with_co___long_names_partition__dbt_tmp')
    )
  DROP index test_normalization.nested_stream_with_co___long_names_partition__dbt_tmp.test_normalization_nested_stream_with_co___long_names_partition__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX test_normalization_nested_stream_with_co___long_names_partition__dbt_tmp_cci
    ON test_normalization.nested_stream_with_co___long_names_partition__dbt_tmp

   

