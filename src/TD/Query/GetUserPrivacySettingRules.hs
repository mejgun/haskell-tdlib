{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetUserPrivacySettingRules where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.UserPrivacySetting as UserPrivacySetting
import qualified Utils as U

-- |
-- Returns the current privacy settings @setting The privacy setting
data GetUserPrivacySettingRules = GetUserPrivacySettingRules
  { -- |
    setting :: Maybe UserPrivacySetting.UserPrivacySetting
  }
  deriving (Eq)

instance Show GetUserPrivacySettingRules where
  show
    GetUserPrivacySettingRules
      { setting = setting
      } =
      "GetUserPrivacySettingRules"
        ++ U.cc
          [ U.p "setting" setting
          ]

instance T.ToJSON GetUserPrivacySettingRules where
  toJSON
    GetUserPrivacySettingRules
      { setting = setting
      } =
      A.object
        [ "@type" A..= T.String "getUserPrivacySettingRules",
          "setting" A..= setting
        ]
