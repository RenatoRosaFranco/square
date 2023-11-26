# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# North American Countries
north_american_countries = ['US', 'CA', 'MX']
north_american_countries.each do |code|
  Country.find_or_create_by!(country_code: code, region: 'North America')
end

# Europe Countries
european_countries = ['DE', 'AT', 'BE', 'BG', 'HR', 'DK', 'ES', 'FR', 'GR', 'NL', 'HU', 'IE', 'NO', 'PL', 'GB', 'RO', 'RU', 'SE', 'CH', 'TR', 'UA']
european_countries.each do |code|
  Country.find_or_create_by!(country_code: code, region: 'Europe')
end

# South American Countries
south_american_countries = ['BR', 'AR', 'CL', 'CO', 'PE', 'VE', 'EC', 'BO', 'PY', 'YU', 'GY', 'SR']
south_american_countries.each do |code|
  Country.find_or_create_by!(country_code: code, region: 'South America')
end