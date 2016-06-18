Rails.configuration.stripe = {
  :publishable_key => 'pk_test_GZzKl1LRSB5gqHohCizCZKrW',
  :secret_key      => 'sk_test_vw0klrXnn6kkY4yxAqJ0u4g0'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]