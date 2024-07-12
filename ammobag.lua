function AmmoBagBase:_take_ammo(unit)
	local taken = 0
	local inventory = unit:inventory()

	if inventory then
		for _, weapon in pairs(inventory:available_selections()) do
			local took = self:round_value(weapon.unit:base():add_ammo_from_bag(self._ammo_amount))
			taken = taken + took
			self._ammo_amount = self:round_value(self._ammo_amount)

			if self._ammo_amount <= 0 then
				taken = self._max_ammo_amount

				self:_set_empty()

				return taken
			end
		end
	end

	return taken
end