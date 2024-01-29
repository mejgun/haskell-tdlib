module TD.Query.GetReadDatePrivacySettings
  (GetReadDatePrivacySettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns privacy settings for message read date. Returns 'TD.Data.ReadDatePrivacySettings.ReadDatePrivacySettings'
data GetReadDatePrivacySettings
  = GetReadDatePrivacySettings
  deriving (Eq, Show)

instance I.ShortShow GetReadDatePrivacySettings where
  shortShow
    GetReadDatePrivacySettings
        = "GetReadDatePrivacySettings"

instance AT.ToJSON GetReadDatePrivacySettings where
  toJSON
    GetReadDatePrivacySettings
        = A.object
          [ "@type" A..= AT.String "getReadDatePrivacySettings"
          ]

