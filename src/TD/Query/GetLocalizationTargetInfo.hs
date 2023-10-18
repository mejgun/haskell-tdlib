module TD.Query.GetLocalizationTargetInfo
  (GetLocalizationTargetInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about the current localization target. This is an offline request if only_local is true. Can be called before authorization. Returns 'TD.Data.LocalizationTargetInfo.LocalizationTargetInfo'
data GetLocalizationTargetInfo
  = GetLocalizationTargetInfo
    { only_local :: Maybe Bool -- ^ Pass true to get only locally available information without sending network requests
    }
  deriving (Eq, Show)

instance I.ShortShow GetLocalizationTargetInfo where
  shortShow
    GetLocalizationTargetInfo
      { only_local = only_local_
      }
        = "GetLocalizationTargetInfo"
          ++ I.cc
          [ "only_local" `I.p` only_local_
          ]

instance AT.ToJSON GetLocalizationTargetInfo where
  toJSON
    GetLocalizationTargetInfo
      { only_local = only_local_
      }
        = A.object
          [ "@type"      A..= AT.String "getLocalizationTargetInfo"
          , "only_local" A..= only_local_
          ]

