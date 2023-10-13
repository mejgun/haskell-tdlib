module TD.Query.GetJsonValue
  (GetJsonValue(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetJsonValue -- ^ Converts a JSON-serialized string to corresponding JsonValue object. Can be called synchronously
  = GetJsonValue
    { json :: Maybe T.Text -- ^ The JSON-serialized string
    }
  deriving (Eq)

instance Show GetJsonValue where
  show
    GetJsonValue
      { json = json_
      }
        = "GetJsonValue"
          ++ I.cc
          [ "json" `I.p` json_
          ]

instance AT.ToJSON GetJsonValue where
  toJSON
    GetJsonValue
      { json = json_
      }
        = A.object
          [ "@type" A..= AT.String "getJsonValue"
          , "json"  A..= json_
          ]

