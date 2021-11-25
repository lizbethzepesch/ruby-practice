require_relative 'db/dropDB'
require_relative 'db/createDB'
require_relative 'parsFile/pars'
require 'csv'

def migrateDataToDb()
    db = PG.connect(:dbname => 'bigtask', :password => '', :port => 5432, :user => 'chausanton')
    csvFile = CSV.read("./Data_for_task_1.csv", headers: true)
    dropDB(db)
    createDB(db)
    getOfficesInfo(csvFile, db)
    getZonesInfo(csvFile, db)
    getRoomsInfo(csvFile, db)
    getFixturesInfo(csvFile, db)
    getMarketingMaterialsInfo(csvFile, db);
end


migrateDataToDb()