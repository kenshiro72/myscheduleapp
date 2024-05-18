class Schedule < ApplicationRecord
    validates :title, presence: true
    validates :title, length: {maximum: 20}
    validates :startdate, presence: true
    validates :enddate, presence: true
    validates :memo, length: {maximum: 500}
    validate :enddate_cannot_be_before_startdate

    def enddate_cannot_be_before_startdate
        if !enddate.nil? && !startdate.nil? && enddate < startdate
          errors.add(:enddate, "は開始日以降の日付で選択してください。")  
        end
    end    
end
