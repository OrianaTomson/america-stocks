class MylistStock < ApplicationRecord
    belongs_to :mylist
    belongs_to :stock
end
