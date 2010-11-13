﻿-- Author      : Kwast
-- Create Date : 1/11/2008 3:46:08 PM

-- savedvariable
ManaWarning_Settings = {};

-- defaults
bManaWarningActive = true;
sManaWarningMsg = "Need Mana";
iManaWarningTmr = 20;
iManaTreshhold = 50.0;
bManaDoPotsCheck = true;
bManaDoCombatCheck = true;

bManaOomStatusAnnounce = true;
iOomPercentageTreshhold = 5.0;
iOomWarningTmr = 60;

bHealthWarningActive = true;
sHealthWarningMsg = "Need Healing";
iHealthWarningTmr = 20;
iHealthTreshhold = 50.0;
bHealthDoPotsCheck = true;
bHealthDoCombatCheck = true;

sPotionHint = "";


function chkWarningMana_OnClick()
	if ( chkWarningMana:GetChecked() ) then
		edManaThresh:Show();
		lblManaThresh:Show();
		lblMana:Show();
		lblManaText:Show();
		edManaText:Show();
		lblManaInt:Show();
		edManaInt:Show();
		lblManaIntSeconds:Show();
	else
		edManaThresh:Hide();
		lblManaThresh:Hide();
		lblMana:Hide();
		lblManaText:Hide();
		edManaText:Hide();
		lblManaInt:Hide();
		edManaInt:Hide();
		lblManaIntSeconds:Hide();
	end
end

function chkWarningHealth_OnClick()
	if ( chkWarningHealth:GetChecked() ) then
		edHealthThresh:Show();
		lblHealthThresh:Show();
		lblHealth:Show();
		chkWarningHealthCombat:Show();
		chkWarningHealthChecks:Show();
		lblHealthText:Show();
		edHealthText:Show();
		lblHealthInt:Show();
		edHealthInt:Show();
		lblHealthIntSeconds:Show();
	else
		edHealthThresh:Hide();
		lblHealthThresh:Hide();
		lblHealth:Hide();
		chkWarningHealthCombat:Hide();
		chkWarningHealthChecks:Hide();
		lblHealthText:Hide();
		edHealthText:Hide();
		lblHealthInt:Hide();
		edHealthInt:Hide();
		lblHealthIntSeconds:Hide();
	end
end

function chkWarningOom_OnClick()
	if ( chkWarningOom:GetChecked() ) then
		lblOomThresh:Show();
		edOomThresh:Show();
		lblOomThreshPerc:Show();
		lblOomInt:Show();
		edOomInt:Show();
		lblOomIntSeconds:Show();
	else
		lblOomThresh:Hide();
		edOomThresh:Hide();
		lblOomThreshPerc:Hide();
		lblOomInt:Hide();
		edOomInt:Hide();
		lblOomIntSeconds:Hide();
	end
end

function btnSave_OnClick()
	ManaWarningSettings_SaveSettingsIntoVars();
	ManaWarningSettings_SaveToSavedVariables();
end

function btnCancel_OnClick()
	ManaWarningSettings_LoadFromSavedVariables();
end

function ManaWarningSettings_InitDefaults()
	bManaWarningActive = true;
	sManaWarningMsg = "Need Mana";
	iManaWarningTmr = 20;
	iManaTreshhold = 50.0;
	bManaDoPotsCheck = true;
	bManaDoCombatCheck = true;

	bManaOomStatusAnnounce = true;
	iOomPercentageTreshhold = 10.0;
	iOomWarningTmr = 60;

	bHealthWarningActive = true;
	sHealthWarningMsg = "Need Healing";
	iHealthWarningTmr = 20;
	iHealthTreshhold = 50.0;
	bHealthDoPotsCheck = true;
	bHealthDoCombatCheck = true;
end

function ManaWarningSettings_LoadFromVars()
	chkWarningMana:SetChecked( bManaWarningActive );
	edManaThresh:SetNumber( iManaTreshhold );	
	edManaText:SetText( sManaWarningMsg );
	edManaInt:SetNumber( iManaWarningTmr );
	chkWarningManaCombat:SetChecked( bManaDoCombatCheck );
	chkWarningManaChecks:SetChecked( bManaDoPotsCheck );

	chkWarningHealth:SetChecked( bHealthWarningActive );
	edHealthThresh:SetNumber( iHealthTreshhold );
	edHealthText:SetText( sHealthWarningMsg );
	edHealthInt:SetNumber( iHealthWarningTmr );
	chkWarningHealthCombat:SetChecked( bHealthDoCombatCheck );
	chkWarningHealthChecks:SetChecked( bHealthDoPotsCheck );

	chkWarningOom:SetChecked( bManaOomStatusAnnounce );
	edOomThresh:SetNumber( iOomPercentageTreshhold );
	edOomInt:SetNumber( iOomWarningTmr );
end

function ManaWarningSettings_SaveSettingsIntoVars()
	bManaWarningActive		= chkWarningMana:GetChecked();
	iManaTreshhold			= edManaThresh:GetNumber();	
	sManaWarningMsg			= edManaText:GetText();
	iManaWarningTmr			= edManaInt:GetNumber();
	bManaDoCombatCheck		= chkWarningManaCombat:GetChecked();
	bManaDoPotsCheck		= chkWarningManaChecks:GetChecked();

	bHealthWarningActive	= chkWarningHealth:GetChecked();
	iHealthTreshhold		= edHealthThresh:GetNumber();
	sHealthWarningMsg		= edHealthText:GetText();
	iHealthWarningTmr		= edHealthInt:GetNumber();
	bHealthDoCombatCheck	= chkWarningHealthCombat:GetChecked();
	bHealthDoPotsCheck		= chkWarningHealthChecks:GetChecked();

	bManaOomStatusAnnounce	= chkWarningOom:GetChecked();
	iOomPercentageTreshhold = edOomThresh:GetNumber();
	iOomWarningTmr			= edOomInt:GetNumber();
end

function ManaWarningSettings_Refresh()
	chkWarningManaText:SetText( "Mana warning" );
	chkWarningHealthText:SetText( "Health warning" );
	chkWarningOomText:SetText( "OOM warning" );
	chkWarningManaCombatText:SetText( "Only when in combat" );
	chkWarningManaChecksText:SetText( "Check cooldowns" );
	chkWarningHealthCombatText:SetText( "Only when in combat" );
	chkWarningHealthChecksText:SetText( "Check cooldowns" );
	
	ManaWarningSettings_LoadFromVars();
	
	chkWarningMana_OnClick();
	chkWarningHealth_OnClick();
	chkWarningOom_OnClick();
end

function ManaWarningSettings_LoadFromSavedVariables()
	if ( table.getn(ManaWarning_Settings) == 15 ) then
		bManaWarningActive = ManaWarning_Settings[1];
		iManaTreshhold = ManaWarning_Settings[2];
		sManaWarningMsg = ManaWarning_Settings[3];
		iManaWarningTmr = ManaWarning_Settings[4];
		bManaDoCombatCheck = ManaWarning_Settings[5];
		bManaDoPotsCheck = ManaWarning_Settings[6];
		bHealthWarningActive = ManaWarning_Settings[7];
		iHealthTreshhold = ManaWarning_Settings[8];
		sHealthWarningMsg = ManaWarning_Settings[9];
		iHealthWarningTmr = ManaWarning_Settings[10];
		bHealthDoCombatCheck = ManaWarning_Settings[11];
		bHealthDoPotsCheck = ManaWarning_Settings[12];
		bManaOomStatusAnnounce = ManaWarning_Settings[13];
		iOomPercentageTreshhold = ManaWarning_Settings[14];
		iOomWarningTmr = ManaWarning_Settings[15];
		
		-- dirty hack for old situation with mp instead of percentages
		if iManaTreshhold > 100.0 then
			iManaTreshhold = 50.0;
		end
		if iHealthTreshhold > 100.0 then
			iHealthTreshhold = 50.0;
		end
	else
		ManaWarningSettings_InitDefaults();
		ManaWarningSettings_SaveToSavedVariables();
	end
end

function ManaWarningSettings_SaveToSavedVariables()
	ManaWarning_Settings = {};
	ManaWarning_Settings[1] = bManaWarningActive;
	ManaWarning_Settings[2] = iManaTreshhold;	
	ManaWarning_Settings[3] = sManaWarningMsg;
	ManaWarning_Settings[4] = iManaWarningTmr;
	ManaWarning_Settings[5] = bManaDoCombatCheck;
	ManaWarning_Settings[6] = bManaDoPotsCheck;
	ManaWarning_Settings[7] = bHealthWarningActive;
	ManaWarning_Settings[8] = iHealthTreshhold;
	ManaWarning_Settings[9] = sHealthWarningMsg;
	ManaWarning_Settings[10] = iHealthWarningTmr;
	ManaWarning_Settings[11] = bHealthDoCombatCheck;
	ManaWarning_Settings[12] = bHealthDoPotsCheck;
	ManaWarning_Settings[13] = bManaOomStatusAnnounce;
	ManaWarning_Settings[14] = iOomPercentageTreshhold;
	ManaWarning_Settings[15] = iOomWarningTmr;
end

function btnRestoreDefaults_OnClick()
	ManaWarningSettings_InitDefaults();
	ManaWarningSettings_LoadFromVars();
	
	chkWarningMana_OnClick();
	chkWarningHealth_OnClick();
	chkWarningOom_OnClick();
end

-------------------------------------------------


-- consts
CONST_VARSLOADED = "VARIABLES_LOADED";
CONST_POWERUPDATE = "UNIT_POWER";
CONST_HEALTHUPDATE = "UNIT_HEALTH";
CONST_PLAYER = "player";

-- vars
bReady = false;
bManaWarningGiven = false;
bHealthWarningGiven = false;
bManaOOMWarningGiven = false;

bDebug = false;

-- Mage shared cooldown gems
MANA_RESTORING_STUFF_A = {
	[33312] = "Mana Sapphire",
	[22044] = "Mana Emerald",
	[8008] = "Mana Sapphire",
	[8007] = "Mana Citrine",
	[5513] = "Mana Jade",
	[5514] = "Mana Agate",
};


-- Shared cooldown mana pots
MANA_RESTORING_STUFF_B = {
	[40077] = "Crazy Alchemist's Potion",
	[42545] = "Runic Mana Injector",
	[33448] = "Runic Mana Potion",
	[43570] = "Endless Mana Potion",
	[22832] = "Super Mana Potion",
	[33093] = "Mana Potion Injector",
	[40067] = "Icy Mana Potion",
	[43530] = "Argent Mana Potion",
	[34440] = "Mad Alchemist's Potion",
	[22850] = "Super Rejuvenation Potion",
	[31677] = "Fel Mana Potion",
	[28101] = "Unstable Mana Potion",
	[13444] = "Major Mana Potion",
	[33935] = "Crystal Mana Potion",
	[32948] = "Auchenai Mana Potion",
};

-- health stuff; no cooldown, just disapears when used
HEALTH_RESTORING_STUFF_A = {
	[22105] = "Master Healthstone",
	[22104] = "Master Healthstone",
	[22103] = "Master Healthstone",
	[32578] = "Charged Crystal Focus",
};

-- Shared cooldown mana pots
HEALTH_RESTORING_STUFF_B = {
	[40077] = "Crazy Alchemist's Potion",
	[41166] = "Runic Healing Injector",
	[33447] = "Runic Healing Potion",
	[43569] = "Endless Healing Potion",
	[22829] = "Super Healing Potion",
	[33092] = "Healing Potion Injector",
	[43531] = "Argent Healing Potion",
	[34440] = "Mad Alchemist's Potion",
	[22850] = "Super Rejuvenation Potion",
	[31676] = "Fel Regeneration Potion",
	[13446] = "Major Healing Potion",
	[33934] = "Crystal Healing Potion",
	[32947] = "Auchenai Healing Potion",
};



-- OnLoad function
function ManaWarning_OnLoad(obj)
	ManaWarningSettings:Hide();

	obj:RegisterEvent( CONST_VARSLOADED );
	obj:RegisterEvent( CONST_POWERUPDATE );
	obj:RegisterEvent( CONST_HEALTHUPDATE );

	obj.name = "ManaWarning";
        obj.okay = function (obj) btnSave_OnClick(); end;
        obj.cancel = function (obj) btnCancel_OnClick(); end;
	obj.default = function (obj) btnRestoreDefaults_OnClick(); end;
	obj.refresh = function (obj) ManaWarningSettings_Refresh(); end;

	InterfaceOptions_AddCategory(obj);
end

-- OnEvent
function ManaWarning_OnEvent( obj, event, ... )
   if ( event == CONST_VARSLOADED ) then
      ManaWarningSettings_LoadFromSavedVariables();

      bReady = true;
   elseif ( event == CONST_POWERUPDATE ) then
		local unitId, resource = ...;
		if ( bManaWarningActive or bManaOomStatusAnnounce ) then
			if (resource == "MANA") then
				--  or (resource == "FOCUS") ??
				-- apparently you get updates for everyone in your party/raid, so check if we get a "player" update
				if ( unitId == CONST_PLAYER ) then
					ManaWarning_PlayerManaUpdate();
				end
			end
		end
   elseif ( event == CONST_HEALTHUPDATE ) then
		local unitId = ...;
		if ( bHealthWarningActive ) then
			if ( unitId == CONST_PLAYER ) then
				ManaWarning_PlayerHealthUpdate();
			end
		end
   end
end

function getLowestCDInArrayOfItems( iHighestCD, array )
   iLowestRemainingTime = iHighestCD;

   for itemId,sName in pairs(array) do
      ic = GetItemCount( itemId );
	
      if ( ic > 0 ) then
         pot_start, pot_dur, pot_en = GetItemCooldown( itemId );
         remaining_time = 0;

         if ( pot_start > 0 ) then
            current_time = GetTime();
            remaining_time = floor( pot_dur - (current_time - pot_start) );
         end

         if ( remaining_time < iLowestRemainingTime ) then
            iLowestRemainingTime = remaining_time;
         end
      end

      if ( iLowestRemainingTime == 0 ) then
         sPotionHint = sName;
         
         break;
      end
   end

   return iLowestRemainingTime;
end

function getSpellCD( sName )
   current_time = GetTime();

   spell_start, spell_dur, spell_en = GetSpellCooldown( sName );
   if ( spell_start ) then
		if spell_dur < 1.5 then	-- ignore gcd
			return 0;
		else
		   if ( spell_start > 0 ) then
			  remaining_time = floor( spell_dur - (current_time - spell_start) );

			  return remaining_time;
		   end
		end
   end
   
   return 0;
end

function HasManaTideTotemOut()
	for i = 1, 40 do
		local buff = UnitBuff(CONST_PLAYER, i);
		if buff then
			if (buff == "Mana Tide Totem") then
				return true;
			end
		end
	end
	
	return false;
end

-- Are all Mana restoring items on cooldown?
function ManaWarning_TimeManaOnCooldown()
   iLowestRemainingTime = 600;   -- 10 minutes

   iLowestRemainingTime = getLowestCDInArrayOfItems( iLowestRemainingTime, MANA_RESTORING_STUFF_A );
   if ( iLowestRemainingTime == 0 ) then
      return 0;
   end

   -- special spells
   locClass, enClass = UnitClass( CONST_PLAYER );

   if ( enClass == "DRUID" ) then
      iSpCd = getSpellCD( "Innervate" );

      if ( iSpCd < iLowestRemainingTime ) then
         iLowestRemainingTime = iSpCd;
      end
      if ( iSpCd == 0 ) then
         sPotionHint = "Innervate";
         return 0;
      end
   elseif ( enClass == "MAGE" ) then
      iSpCd = getSpellCD( "Evocation" );

      if ( iSpCd < iLowestRemainingTime ) then
         iLowestRemainingTime = iSpCd;
      end
      if ( iSpCd == 0 ) then
         sPotionHint = "Evocation";
         return 0;
      end
   elseif ( enClass == "PRIEST" ) then
      iSpCd = getSpellCD( "Shadowfiend" );

      if ( iSpCd < iLowestRemainingTime ) then
         iLowestRemainingTime = iSpCd;
      end
      if ( iSpCd == 0 ) then
         sPotionHint = "Shadowfiend";
         return 0;
      end
   elseif ( enClass == "SHAMAN" ) then
		iSpCd = getSpellCD("Mana Tide Totem")
		
		if ( iSpCd == 0 ) and not HasManaTideTotemOut() then
			sPotionHint = "Mana Tide Totem";
			return 0;
		end
   end
   
   iLowestRemainingTime = getLowestCDInArrayOfItems( iLowestRemainingTime, MANA_RESTORING_STUFF_B );
   if ( iLowestRemainingTime == 0 ) then
      return 0;
   end


   if ( enClass == "HUNTER" ) then
		-- used to be stuff with Aspect of the Viper :(
		--sPotionHint = "Steady Shot";
		--return 0;
   end

   return iLowestRemainingTime;
end


-- Are all Health restoring items on cooldown?
function ManaWarning_TimeHealthOnCooldown()
   iLowestRemainingTime = 600;   -- 10 minutes

   iLowestRemainingTime = getLowestCDInArrayOfItems( iLowestRemainingTime, HEALTH_RESTORING_STUFF_A );
   if ( iLowestRemainingTime == 0 ) then
      return 0;
   end
   
   iLowestRemainingTime = getLowestCDInArrayOfItems( iLowestRemainingTime, HEALTH_RESTORING_STUFF_B );
   if ( iLowestRemainingTime == 0 ) then
      return 0;
   end

   return iLowestRemainingTime;
end

function ManaWarning_MessagePartyRaid( sMsg )
   RaidNotice_AddMessage(RaidBossEmoteFrame, sMsg, ChatTypeInfo["RAID_WARNING"]);

   if ( UnitInRaid( CONST_PLAYER ) ) then
      SendChatMessage( sMsg, "RAID", nil, "" );
   elseif ( GetPartyMember(1) == 1 ) then
      SendChatMessage( sMsg, "PARTY", nil, "" );
   else
      if DEFAULT_CHAT_FRAME then
         DEFAULT_CHAT_FRAME:AddMessage( sMsg, 1.0, 0.0, 0.0);
      end
   end
end

function ManaWarning_MessageSelf( sMsg )
  RaidNotice_AddMessage(RaidBossEmoteFrame, sMsg, ChatTypeInfo["RAID_WARNING"]);

  if DEFAULT_CHAT_FRAME then
     DEFAULT_CHAT_FRAME:AddMessage( sMsg, 1.0, 0.0, 0.0);
  end
end

-- PlayerManaUpdate
function ManaWarning_PlayerManaUpdate()
   -- if mana user atm
   if ( UnitPowerType( CONST_PLAYER ) == 0 ) then
	   maxmana = UnitManaMax( CONST_PLAYER );
	   currentmana = UnitMana( CONST_PLAYER );
	   
	   bMayGiveWarning = true;
	   if ( bManaDoCombatCheck ) then
		  -- don't warn if we're not in combat
		  if ( UnitAffectingCombat( CONST_PLAYER ) == nil ) then
			 bMayGiveWarning = false;
		  end
	   end

	   iLowestRemainingTime = 0;
	   if ( bManaDoPotsCheck ) then
          sPotionHint = "";
		  iLowestRemainingTime = ManaWarning_TimeManaOnCooldown();
	   end

	   if ( bMayGiveWarning and bManaOomStatusAnnounce and not bManaOOMWarningGiven ) then
		  oom_tresh = maxmana / 100.0 * iOomPercentageTreshhold;
		  if ( currentmana < oom_tresh ) then
			 bManaOOMWarningGiven = true;

			 if ( bManaDoPotsCheck ) then
				ManaWarning_MessagePartyRaid( "OOM! (CD's "..iLowestRemainingTime.."s)" );
			 else
				ManaWarning_MessagePartyRaid( "OOM!" );
			 end

			 DBM.Schedule( iOomWarningTmr, ManaWarning_ResetManaOOMWarningGiven );
		  end
	   end

	   if ( bManaWarningActive and bMayGiveWarning and not bManaWarningGiven ) then
		  mana_tresh = maxmana / 100.0 * iManaTreshhold;
		  if ( currentmana < mana_tresh ) then
			 bManaWarningGiven = true;

			 if ( iLowestRemainingTime == 0 ) then
				iLowestRemainingTime = iManaWarningTmr;
			 end

			 DBM.Schedule( iLowestRemainingTime, ManaWarning_ResetManaWarningGiven );

             if ( bManaDoPotsCheck ) then
                if not ( sPotionHint == "" ) then
                   ManaWarning_MessageSelf( sManaWarningMsg .. " (Try using " .. sPotionHint .. ")");
                end
             else
				ManaWarning_MessageSelf( sManaWarningMsg );
             end
		  else
			-- class specific stuff once no more below treshhold
			--locClass, enClass = UnitClass( CONST_PLAYER );
			--if ( enClass == "HUNTER" ) then
			--end
		  end
	   end
   end
end

-- PlayerHealthUpdate
function ManaWarning_PlayerHealthUpdate()
   currenthp = UnitHealth( CONST_PLAYER );
   maxhp = UnitHealthMax( CONST_PLAYER );

   bMayGiveWarning = true;
   if ( bHealthDoCombatCheck ) then
      -- don't warn if we're not in combat
      if ( UnitAffectingCombat( CONST_PLAYER ) == nil ) then
         bMayGiveWarning = false;
      end
   end

   if ( bMayGiveWarning and not bHealthWarningGiven ) then
	  health_tresh = maxhp / 100.0 * iHealthTreshhold;
	  if ( currenthp < health_tresh ) then
         bHealthWarningGiven = true;

         iLowestRemainingTime = 0;
         if ( bHealthDoPotsCheck ) then
			sPotionHint = "";
            iLowestRemainingTime = ManaWarning_TimeHealthOnCooldown();
         end

         if ( iLowestRemainingTime == 0 ) then
            iLowestRemainingTime = iHealthWarningTmr;
         end

         DBM.Schedule( iLowestRemainingTime, ManaWarning_ResetHealthWarningGiven );
         
         if ( bHealthDoPotsCheck ) then
            if not ( sPotionHint == "" ) then
				ManaWarning_MessageSelf( sHealthWarningMsg .. " (Try using " .. sPotionHint .. ")");
            end
         else
			ManaWarning_MessageSelf( sHealthWarningMsg );
         end
      end
   end
end


-- Resets a boolean, so the ManaWarning will again show on the screen if we're still without mana
function ManaWarning_ResetManaWarningGiven()
   DBM.UnSchedule( ManaWarning_ResetManaWarningGiven );
   bManaWarningGiven = false;
end

function ManaWarning_ResetHealthWarningGiven()
   DBM.UnSchedule( ManaWarning_ResetHealthWarningGiven );
   bHealthWarningGiven = false;
end

-- Resets a boolean, so the OOM-message will again show
function ManaWarning_ResetManaOOMWarningGiven()
   DBM.UnSchedule( ManaWarning_ResetManaOOMWarningGiven );
   bManaOOMWarningGiven = false;
end
