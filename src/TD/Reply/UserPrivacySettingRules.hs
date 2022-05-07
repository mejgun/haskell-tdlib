{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.UserPrivacySettingRules where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.UserPrivacySettingRule as UserPrivacySettingRule
import qualified Utils as U

data UserPrivacySettingRules = -- | A list of privacy rules. Rules are matched in the specified order. The first matched rule defines the privacy setting for a given user. If no rule matches, the action is not allowed @rules A list of rules
  UserPrivacySettingRules
  { -- |
    rules :: Maybe [UserPrivacySettingRule.UserPrivacySettingRule]
  }
  deriving (Eq)

instance Show UserPrivacySettingRules where
  show
    UserPrivacySettingRules
      { rules = rules
      } =
      "UserPrivacySettingRules"
        ++ U.cc
          [ U.p "rules" rules
          ]

instance T.FromJSON UserPrivacySettingRules where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "userPrivacySettingRules" -> parseUserPrivacySettingRules v
      _ -> fail ""
    where
      parseUserPrivacySettingRules :: A.Value -> T.Parser UserPrivacySettingRules
      parseUserPrivacySettingRules = A.withObject "UserPrivacySettingRules" $ \o -> do
        rules_ <- o A..:? "rules"
        return $ UserPrivacySettingRules {rules = rules_}
  parseJSON _ = fail ""

instance T.ToJSON UserPrivacySettingRules where
  toJSON
    UserPrivacySettingRules
      { rules = rules
      } =
      A.object
        [ "@type" A..= T.String "userPrivacySettingRules",
          "rules" A..= rules
        ]
