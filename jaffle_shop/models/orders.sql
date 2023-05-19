with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    from {{ source('jaffle_shop', 'customers') }}

),

orders as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from {{ source('jaffle_shop', 'orders') }}

),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        orders.order_id,
        orders.status
    from customers

    left join {{ source('jaffle_shop', 'orders') }} using (customer_id)

)

select * from final