-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserPrivacySettingRules where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.UserPrivacySettingRule as UserPrivacySettingRule

-- |
-- 
-- A list of privacy rules. Rules are matched in the specified order. The first matched rule defines the privacy setting for a given user. If no rule matches, the action is not allowed 
-- 
-- __rules__ A list of rules
data UserPrivacySettingRules = 

 UserPrivacySettingRules { rules :: Maybe [UserPrivacySettingRule.UserPrivacySettingRule] }  deriving (Eq)

instance Show UserPrivacySettingRules where
 show UserPrivacySettingRules { rules=rules } =
  "UserPrivacySettingRules" ++ U.cc [U.p "rules" rules ]

instance T.ToJSON UserPrivacySettingRules where
 toJSON UserPrivacySettingRules { rules = rules } =
  A.object [ "@type" A..= T.String "userPrivacySettingRules", "rules" A..= rules ]

instance T.FromJSON UserPrivacySettingRules where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "userPrivacySettingRules" -> parseUserPrivacySettingRules v
   _ -> mempty
  where
   parseUserPrivacySettingRules :: A.Value -> T.Parser UserPrivacySettingRules
   parseUserPrivacySettingRules = A.withObject "UserPrivacySettingRules" $ \o -> do
    rules <- o A..:? "rules"
    return $ UserPrivacySettingRules { rules = rules }
 parseJSON _ = mempty
