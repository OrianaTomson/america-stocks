class Mylist < ApplicationRecord
    has_many :mylist_stocks
    has_many :stocks, through: :mylist_stocks
end
