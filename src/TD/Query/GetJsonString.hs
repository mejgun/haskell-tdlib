module TD.Query.GetJsonString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.JsonValue as JsonValue

data GetJsonString -- ^ Converts a JsonValue object to corresponding JSON-serialized string. Can be called synchronously
  = GetJsonString
    { json_value :: Maybe JsonValue.JsonValue -- ^ The JsonValue object
    }
  deriving (Eq)

instance Show GetJsonString where
  show
    GetJsonString
      { json_value = json_value_
      }
        = "GetJsonString"
          ++ I.cc
          [ "json_value" `I.p` json_value_
          ]

instance AT.ToJSON GetJsonString where
  toJSON
    GetJsonString
      { json_value = json_value_
      }
        = A.object
          [ "@type"      A..= AT.String "getJsonString"
          , "json_value" A..= json_value_
          ]
