-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetUserPrivacySettingRules where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserPrivacySettingRules as UserPrivacySettingRules
import {-# SOURCE #-} qualified API.UserPrivacySetting as UserPrivacySetting

--main = putStrLn "ok"

data SetUserPrivacySettingRules = 
 SetUserPrivacySettingRules { rules :: UserPrivacySettingRules.UserPrivacySettingRules, setting :: UserPrivacySetting.UserPrivacySetting }  deriving (Show)

instance T.ToJSON SetUserPrivacySettingRules where
 toJSON (SetUserPrivacySettingRules { rules = rules, setting = setting }) =
  A.object [ "@type" A..= T.String "setUserPrivacySettingRules", "rules" A..= rules, "setting" A..= setting ]



instance T.FromJSON SetUserPrivacySettingRules where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setUserPrivacySettingRules" -> parseSetUserPrivacySettingRules v

   _ -> mempty ""
  where
   parseSetUserPrivacySettingRules :: A.Value -> T.Parser SetUserPrivacySettingRules
   parseSetUserPrivacySettingRules = A.withObject "SetUserPrivacySettingRules" $ \o -> do
    rules <- o A..: "rules"
    setting <- o A..: "setting"
    return $ SetUserPrivacySettingRules { rules = rules, setting = setting }