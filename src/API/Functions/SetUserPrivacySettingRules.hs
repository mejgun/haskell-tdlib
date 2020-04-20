-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetUserPrivacySettingRules where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserPrivacySettingRules as UserPrivacySettingRules
import {-# SOURCE #-} qualified API.UserPrivacySetting as UserPrivacySetting

--main = putStrLn "ok"

data SetUserPrivacySettingRules = 
 SetUserPrivacySettingRules { rules :: UserPrivacySettingRules.UserPrivacySettingRules, setting :: UserPrivacySetting.UserPrivacySetting }  -- deriving (Show)

instance T.ToJSON SetUserPrivacySettingRules where
 toJSON (SetUserPrivacySettingRules { rules = rules, setting = setting }) =
  A.object [ "@type" A..= T.String "setUserPrivacySettingRules", "rules" A..= rules, "setting" A..= setting ]
-- setUserPrivacySettingRules SetUserPrivacySettingRules  { rules :: UserPrivacySettingRules.UserPrivacySettingRules, setting :: UserPrivacySetting.UserPrivacySetting } 

