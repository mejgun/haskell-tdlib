-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUserPrivacySettingRules where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.UserPrivacySetting as UserPrivacySetting

-- |
-- 
-- Returns the current privacy settings 
-- 
-- __setting__ The privacy setting
data GetUserPrivacySettingRules = 

 GetUserPrivacySettingRules { setting :: Maybe UserPrivacySetting.UserPrivacySetting }  deriving (Eq)

instance Show GetUserPrivacySettingRules where
 show GetUserPrivacySettingRules { setting=setting } =
  "GetUserPrivacySettingRules" ++ U.cc [U.p "setting" setting ]

instance T.ToJSON GetUserPrivacySettingRules where
 toJSON GetUserPrivacySettingRules { setting = setting } =
  A.object [ "@type" A..= T.String "getUserPrivacySettingRules", "setting" A..= setting ]

instance T.FromJSON GetUserPrivacySettingRules where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getUserPrivacySettingRules" -> parseGetUserPrivacySettingRules v
   _ -> mempty
  where
   parseGetUserPrivacySettingRules :: A.Value -> T.Parser GetUserPrivacySettingRules
   parseGetUserPrivacySettingRules = A.withObject "GetUserPrivacySettingRules" $ \o -> do
    setting <- o A..:? "setting"
    return $ GetUserPrivacySettingRules { setting = setting }
 parseJSON _ = mempty
