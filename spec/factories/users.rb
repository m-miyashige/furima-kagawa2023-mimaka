FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name            { '田中' }      # 全角文字の例（変更可能）
    first_name           { '太郎' }      # 全角文字の例（変更可能）
    last_name_kana       { 'タナカ' }    # 全角カタカナの例
    first_name_kana      { 'タロウ' }    # 全角カタカナの例
    birth_date           { '1990-01-01' }
  end
end
