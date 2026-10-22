type newInstance = Instance
type FunctionReturningInstance = ({[string]: any}) -> newInstance
type NewFunction = (string, Instance) -> FunctionReturningInstance | Instance | newInstance | nil
type FakeInstanceTable = {
	["new"]: NewFunction;}
local ins = {
	["new"] = function(className: string, ...: Instance): FunctionReturningInstance | Instance | newInstance | nil
		if not(className) then
			return nil :: nil end
		if not(...) then
			return Instance.new(className) :: Instance end
		local newInstance: newInstance = Instance.new(className, ...); return function(propertyTable:{[string]: any}): newInstance
			if not(propertyTable) then
				return newInstance :: newInstance end
			for property, Value in propertyTable do
				newInstance[property] = Value end
			return newInstance :: newInstance end end;}
return ins :: FakeInstanceTable
