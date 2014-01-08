class ChangeUserGetsDailyDharmaDefault < ActiveRecord::Migration
  def up
    change_column_default(:users, :gets_daily_dharma, true)
  end

  def down
    change_column_default(:users, :gets_daily_dharma, false)
  end
end
