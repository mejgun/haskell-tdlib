{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetUserPrivacySettingRules where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.UserPrivacySetting as UserPrivacySetting
import qualified TD.Data.UserPrivacySettingRules as UserPrivacySettingRules
import qualified Utils as U

-- |
-- Changes user privacy settings @setting The privacy setting @rules The new privacy rules
data SetUserPrivacySettingRules = SetUserPrivacySettingRules
  { -- |
    rules :: Maybe UserPrivacySettingRules.UserPrivacySettingRules,
    -- |
    setting :: Maybe UserPrivacySetting.UserPrivacySetting
  }
  deriving (Eq)

instance Show SetUserPrivacySettingRules where
  show
    SetUserPrivacySettingRules
      { rules = rules,
        setting = setting
      } =
      "SetUserPrivacySettingRules"
        ++ U.cc
          [ U.p "rules" rules,
            U.p "setting" setting
          ]

instance T.ToJSON SetUserPrivacySettingRules where
  toJSON
    SetUserPrivacySettingRules
      { rules = rules,
        setting = setting
      } =
      A.object
        [ "@type" A..= T.String "setUserPrivacySettingRules",
          "rules" A..= rules,
          "setting" A..= setting
        ]
