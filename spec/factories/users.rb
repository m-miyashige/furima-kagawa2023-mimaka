FactoryBot.define do
  factory :user do
      nickname             {Faker::Name.initials(number: 2)}
      email                {Faker::Internet.email}
      password             {Faker::Internet.password(min_length: 6)}
      password_confirmation{password}
      last_name            { "佐藤" } # 日本語の姓を生成
      first_name           { "太郎"} # 日本語の名前を生成
      last_name_kana       { "サトウ" } # 日本語のカナの姓を生成
      first_name_kana      { "タロウ" } # 日本語のカナの名前を生成
      birth_date           { Faker::Date.between(from: 100.years.ago, to: 18.years.ago) } # 適当な生年月日を生成
  end
end



