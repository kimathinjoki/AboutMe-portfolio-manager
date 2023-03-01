class Project < ActiveRecord::Bas

    belongs_to :user

    enum :status, [ :CREATED, :ONGOING, :COMPLETED, :CANCELLED ]
end