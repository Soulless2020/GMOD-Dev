AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
include('shared.lua')
function ENT:Initialize()
	self:SetModel(self.model)
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
	self:SetUseType(SIMPLE_USE)

	self.phys = self:GetPhysicsObject()
	if (self.phys:IsValid()) then
		self.phys:Wake()
	end

end

function ENT:OnTakeDamage()
	if not self.Destroyable then return end
	local effectData = EffectData()
	effectData:SetOrigin(self:GetPos())
	effectData:SetMagnitude(1)
	effectData:SetScale(1)
	effectData:SetRadius(2)
	util.Effect("Explosion", effectData)
	self:Remove()
end

function ENT:Use(activator)
	if not self.Ressourceamount or self.Ressourceamount == 0 then return end
	if activator:IsPlayer() then
		if activator:GetNWInt("RessourcePool") >= self.Ressourceamount then
			activator:SetNWInt("RessourcePool", activator:GetNWInt("RessourcePool") - self.Ressourceamount)
			-- You might want to add some feedback here, like a message or a sound
		else
			-- You might want to add some feedback here, like a message or a sound
			print("Not enough resources")
		end
	end
end