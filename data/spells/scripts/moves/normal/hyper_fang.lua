local damageMultiplier = damageMultiplierMoves.singletargetstrong
local effect = 266
local bloodEffect = 10
local combat = COMBAT_NORMALDAMAGE
local defenseType = COMBAT_PHYSICALDAMAGE

function onCastSpell(creature, variant)
	local target = creature:getTarget()
	if not target then return true end

	local damage = damageMultiplier * creature:getTotalMeleeAttack()
	local targetPosition = target:getPosition()

	doTargetCombatHealth(creature.uid, target, combat, -damage, -damage, effect, defenseType)
	targetPosition:sendMagicEffect(bloodEffect)

	return true
end