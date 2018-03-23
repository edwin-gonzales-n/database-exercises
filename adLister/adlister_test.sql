use adlister;

select first_name, last_name, user_email, ad_title, ad_description,cat_name
  from users
  join ad_pivot
    on ad_pivot.user_id = users.id
  join ads
    on ads.id = ad_pivot.ads_id
  join categories
    on categories.id = ad_pivot.categories_id
 where users.id      = 10;
