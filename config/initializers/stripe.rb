Rails.configuration.stripe = {
  publishable_key: 'pk_test_yHAHWWKVuYclLyQ3cmApzwqc',
  secret_key:      'sk_test_7deKdwHt466wxqHeYwzzoiKa'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]