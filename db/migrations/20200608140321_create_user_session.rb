# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :user_sessions do
      primary_key :id, type: :Bignum

      column :uuid, "character varying", null: false
      column :user_id, :Bignum, null: false, foreign_key: true, index: true

      column :created_at, "timestamp(6) without time zone", null: false
      column :updated_at, "timestamp(6) without time zone", null: false
    end
  end
end
