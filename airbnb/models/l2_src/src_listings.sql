with listings as (
    select ID
    , LISTING_URL
    , NAME
    , ROOM_TYPE
    , MINIMUM_NIGHTS
    , HOST_ID
    , PRICE
    , CREATED_AT
    , UPDATED_AT
    from {{ source('airbnb_raw', 'raw_listings') }}
)
select *
from listings