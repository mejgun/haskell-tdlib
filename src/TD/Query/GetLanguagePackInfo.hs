module TD.Query.GetLanguagePackInfo(GetLanguagePackInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetLanguagePackInfo -- ^ Returns information about a language pack. Returned language pack identifier may be different from a provided one. Can be called before authorization
  = GetLanguagePackInfo
    { language_pack_id :: Maybe T.Text -- ^ Language pack identifier
    }
  deriving (Eq)

instance Show GetLanguagePackInfo where
  show
    GetLanguagePackInfo
      { language_pack_id = language_pack_id_
      }
        = "GetLanguagePackInfo"
          ++ I.cc
          [ "language_pack_id" `I.p` language_pack_id_
          ]

instance AT.ToJSON GetLanguagePackInfo where
  toJSON
    GetLanguagePackInfo
      { language_pack_id = language_pack_id_
      }
        = A.object
          [ "@type"            A..= AT.String "getLanguagePackInfo"
          , "language_pack_id" A..= language_pack_id_
          ]
