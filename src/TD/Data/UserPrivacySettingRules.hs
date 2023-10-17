module TD.Data.UserPrivacySettingRules
  ( UserPrivacySettingRules(..)    
  , defaultUserPrivacySettingRules 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UserPrivacySettingRule as UserPrivacySettingRule

data UserPrivacySettingRules
  = UserPrivacySettingRules -- ^ A list of privacy rules. Rules are matched in the specified order. The first matched rule defines the privacy setting for a given user. If no rule matches, the action is not allowed
    { rules :: Maybe [UserPrivacySettingRule.UserPrivacySettingRule] -- ^ A list of rules
    }
  deriving (Eq, Show)

instance I.ShortShow UserPrivacySettingRules where
  shortShow UserPrivacySettingRules
    { rules = rules_
    }
      = "UserPrivacySettingRules"
        ++ I.cc
        [ "rules" `I.p` rules_
        ]

instance AT.FromJSON UserPrivacySettingRules where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userPrivacySettingRules" -> parseUserPrivacySettingRules v
      _                         -> mempty
    
    where
      parseUserPrivacySettingRules :: A.Value -> AT.Parser UserPrivacySettingRules
      parseUserPrivacySettingRules = A.withObject "UserPrivacySettingRules" $ \o -> do
        rules_ <- o A..:?  "rules"
        pure $ UserPrivacySettingRules
          { rules = rules_
          }
  parseJSON _ = mempty

instance AT.ToJSON UserPrivacySettingRules where
  toJSON UserPrivacySettingRules
    { rules = rules_
    }
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingRules"
        , "rules" A..= rules_
        ]

defaultUserPrivacySettingRules :: UserPrivacySettingRules
defaultUserPrivacySettingRules =
  UserPrivacySettingRules
    { rules = Nothing
    }

