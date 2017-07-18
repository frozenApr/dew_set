module DewSet
  module Tools
    extend ActiveSupport::Concern

    included do
      scope :recently, -> { order(id: :desc) }
      scope :newer, -> { order(updated_at: :desc) }
    end
  end
end
