--// SERVICES
local DataStoreService = game:GetService("DataStoreService")


--// CONSTS
local MaxRetries: number = 5


--// MODULE
local DataStoreModule = {}


--// MODULE FUNCTIONS
function DataStoreModule:Get( storeName: string, key: string ): (any, boolean)

	local store = DataStoreService:GetDataStore(storeName)

	local success: boolean, exception: string
	local retries: number = 0
	local value: any

	while not success and retries < MaxRetries do

		success,exception = pcall(function()
			value = store:GetAsync(key)
		end)

		if not success then
			warn("GetAsyncException "..exception)
		end

		retries += 1
	end

	return value,success
end
function DataStoreModule:Set( storeName, key, value ): boolean

	local store = DataStoreService:GetDataStore(storeName)

	local success: boolean, exception: string
	local retries: number = 0

	while not success and retries < MaxRetries do

		success,exception = pcall(store.SetAsync, store, key, value )

		if not success then
			warn("SetAsyncException "..exception)
		end

		retries += 1
	end

	return success
end

function DataStoreModule:GetOrdened( storeName: string, key: string ): (any, boolean)

	local store = DataStoreService:GetOrderedDataStore(storeName)

	local success: boolean, exception: string
	local retries: number = 0
	local value: any

	while not success and retries < MaxRetries do

		success,exception = pcall(function()
			value = store:GetAsync(key)
		end)

		if not success then
			warn("GetOrdenedAsyncException "..exception)
		end

		retries += 1
	end

	return value,success
end
function DataStoreModule:SetOrdened( storeName: string, key: string, value: any ): boolean

	local store = DataStoreService:GetOrderedDataStore(storeName)

	local success: boolean, exception: string
	local retries: number = 0

	while not success and retries < MaxRetries do

		success,exception = pcall(store.SetAsync, store, key, value )

		if not success then
			warn("SetOrdenedAsyncException "..exception)
		end

		retries += 1
	end

	return success
end
function DataStoreModule:GetSortedAsync( storeName: string, isAscending: boolean, pageSize: number, minValue: string|nil, maxValue: string|nil ): DataStorePages

	local store = DataStoreService:GetOrderedDataStore( storeName)

	local success: boolean, exception: string
	local retries: number = 0
	local sortedAsync: DataStorePages

	while not success and retries < MaxRetries do

		success,exception = pcall(function()
			sortedAsync = store:GetSortedAsync( isAscending, pageSize, minValue, maxValue )
		end)

		if not success then
			warn("GetOrdenedAsyncException "..exception)
		end

		retries += 1
	end

	return sortedAsync
end


--// END
return DataStoreModule
