-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserPrivacySettingRules where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserPrivacySettingRule as UserPrivacySettingRule

--main = putStrLn "ok"

data UserPrivacySettingRules = 
 UserPrivacySettingRules { rules :: [UserPrivacySettingRule.UserPrivacySettingRule] }  -- deriving (Show)

instance T.ToJSON UserPrivacySettingRules where
 toJSON (UserPrivacySettingRules { rules = rules }) =
  A.object [ "@type" A..= T.String "userPrivacySettingRules", "rules" A..= rules ]
-- userPrivacySettingRules UserPrivacySettingRules  { rules :: [UserPrivacySettingRule.UserPrivacySettingRule] } 



instance T.FromJSON UserPrivacySettingRules where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "userPrivacySettingRules" -> parseUserPrivacySettingRules v
  where
   parseUserPrivacySettingRules :: A.Value -> T.Parser UserPrivacySettingRules
   parseUserPrivacySettingRules = A.withObject "UserPrivacySettingRules" $ \o -> do
    rules <- o A..: "rules"
    return $ UserPrivacySettingRules { rules = rules }