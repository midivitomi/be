class DestroyMockData < ActiveRecord::Migration[5.0]
  def change
    Season.destroy_all(title: '2016')
    Season.destroy_all(title: '2016/2017')

    Competition.destroy_all(title: 'РФПЛ')
    Competition.destroy_all(title: 'ФНЛ')
    Competition.destroy_all(title: 'ПФЛ')
    Competition.destroy_all(title: 'III дивизион. Черноземье')
    Competition.destroy_all(title: 'Чемпионат Воронежской области')
    Competition.destroy_all(title: 'ВЛДФ')
  end
end
