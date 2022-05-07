{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetJsonString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.JsonValue as JsonValue
import qualified Utils as U

-- |
-- Converts a JsonValue object to corresponding JSON-serialized string. Can be called synchronously @json_value The JsonValue object
data GetJsonString = GetJsonString
  { -- |
    json_value :: Maybe JsonValue.JsonValue
  }
  deriving (Eq)

instance Show GetJsonString where
  show
    GetJsonString
      { json_value = json_value
      } =
      "GetJsonString"
        ++ U.cc
          [ U.p "json_value" json_value
          ]

instance T.ToJSON GetJsonString where
  toJSON
    GetJsonString
      { json_value = json_value
      } =
      A.object
        [ "@type" A..= T.String "getJsonString",
          "json_value" A..= json_value
        ]
