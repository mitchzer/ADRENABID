# config/initializers/money.rb
MoneyRails.configure do |config|
  config.default_currency = :eur  # or :gbp, :usd, etc.
  config.no_cents_if_whole = false
  config.default_format = { no_cents_if_whole: false }
end
