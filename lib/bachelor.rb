require 'pry'

def get_first_name_of_season_winner(data, season)
  first_name, last_name = data[season].find{|contestant| contestant["status"] == "Winner"}["name"].split(' ')
  first_name
end

def get_contestant_name(data, occupation)
  data.each do |season, contestant_pool|
    if contestant_pool.any?{|contestant| contestant["occupation"] == occupation}
      return contestant_pool.find{|contestant| contestant["occupation"] == occupation}["name"]
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  number_contestants = 0

  data.each do |season, contestant_pool|
    number_contestants += contestant_pool.filter{|contestant| contestant["hometown"] == hometown}.length
  end

  number_contestants
end

def get_occupation(data, hometown)
  data.each do |season, contestant_pool|
    if contestant_pool.any?{|contestant| contestant["hometown"] == hometown}
      return contestant_pool.find{|contestant| contestant["hometown"] == hometown}["occupation"]
    end
  end
end

def get_average_age_for_season(data, season)
  age_pool = []
  data[season].each{|contestant| age_pool << contestant["age"].to_i}
  (age_pool.reduce(:+).to_f/age_pool.length).round()
end
