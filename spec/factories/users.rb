FactoryBot.define do

  factory :user do
    nickname              {"kakeru"}
    email                 {"aaa@aaa"}
    password              {"1234567"}
    password_confirmation {"1234567"}
    last_name             {"鈴木"}
    first_name            {"一郎"}
    last_name_kana        {"スズキ"}
    first_name_kana       {"イチロー"}
    birth_date            {"2020-02-02"}
  end
end