-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUserPrivacySettingRules where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserPrivacySetting as UserPrivacySetting

--main = putStrLn "ok"

data GetUserPrivacySettingRules = 
 GetUserPrivacySettingRules { setting :: UserPrivacySetting.UserPrivacySetting }  -- deriving (Show)

instance T.ToJSON GetUserPrivacySettingRules where
 toJSON (GetUserPrivacySettingRules { setting = setting }) =
  A.object [ "@type" A..= T.String "getUserPrivacySettingRules", "setting" A..= setting ]
-- getUserPrivacySettingRules GetUserPrivacySettingRules  { setting :: UserPrivacySetting.UserPrivacySetting } 



instance T.FromJSON GetUserPrivacySettingRules where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getUserPrivacySettingRules" -> parseGetUserPrivacySettingRules v
  where
   parseGetUserPrivacySettingRules :: A.Value -> T.Parser GetUserPrivacySettingRules
   parseGetUserPrivacySettingRules = A.withObject "GetUserPrivacySettingRules" $ \o -> do
    setting <- o A..: "setting"
    return $ GetUserPrivacySettingRules { setting = setting }