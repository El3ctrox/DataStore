# DataStore
A module to manage data stores

--// CREATOR

	Author: El3ctrox
	Date: 11/10/2020
  
--// EXAMPLE

	local DataStore = require(module)
		
	local success = DataStore:GetAsync( "Section1", "45653453", {Level = 2})
	local data, success = DataStore:GetAsync( "Section1", "45653453")

	local success = DataStore:GetOrdened( "MoneyTop", "45653453", 50)
	local data, success = DataStore:GetOrdened( "MoneyTop", "45653453")
  	
  	
  	local isAscending = false
	local pageSize = 10
	local pages = DataStore:GetSorted( "MoneyTop", "45653453")
	local topTen, success = pages:GetCurrentPage()
	
	for rank,store in ipairs(topTen) do
		print( "#"..rank, "-", store.key, store.value)
	end

--// END
