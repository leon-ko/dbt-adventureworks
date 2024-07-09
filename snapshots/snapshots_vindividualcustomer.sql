{% snapshot snapshot_vindividualcustomer %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='businessentityid',
          check_cols='all'
        )
    }}

    select * from {{ source('dbt_lk', 'source_vindividualcustomer') }} where addresstype = 'Home'

{% endsnapshot %}