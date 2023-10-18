module TD.Query.EditCustomLanguagePackInfo
  (EditCustomLanguagePackInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.LanguagePackInfo as LanguagePackInfo

-- | Edits information about a custom local language pack in the current localization target. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data EditCustomLanguagePackInfo
  = EditCustomLanguagePackInfo
    { info :: Maybe LanguagePackInfo.LanguagePackInfo -- ^ New information about the custom local language pack
    }
  deriving (Eq, Show)

instance I.ShortShow EditCustomLanguagePackInfo where
  shortShow
    EditCustomLanguagePackInfo
      { info = info_
      }
        = "EditCustomLanguagePackInfo"
          ++ I.cc
          [ "info" `I.p` info_
          ]

instance AT.ToJSON EditCustomLanguagePackInfo where
  toJSON
    EditCustomLanguagePackInfo
      { info = info_
      }
        = A.object
          [ "@type" A..= AT.String "editCustomLanguagePackInfo"
          , "info"  A..= info_
          ]

