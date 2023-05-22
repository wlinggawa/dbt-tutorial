with reviews as (
    select LISTING_ID
    , DATE
    , REVIEWER_NAME
    , SENTIMENT
    from {{ source('airbnb_raw', 'raw_reviews') }}
),
listings as (
    select ID
    , NAME 
    , PRICE
    from {{ ref('src_listings') }}
),
final as (
    select listings.ID
    , listings.NAME
    , listings.PRICE
    , reviews.DATE
    , reviews.REVIEWER_NAME
    , reviews.SENTIMENT
    from reviews
    left join listings on reviews.LISTING_ID = listings.ID
)
select * from final