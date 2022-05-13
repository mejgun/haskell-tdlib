{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetJsonValue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Converts a JSON-serialized string to corresponding JsonValue object. Can be called synchronously @json The JSON-serialized string
data GetJsonValue = GetJsonValue
  { -- |
    json :: Maybe String
  }
  deriving (Eq)

instance Show GetJsonValue where
  show
    GetJsonValue
      { json = json_
      } =
      "GetJsonValue"
        ++ U.cc
          [ U.p "json" json_
          ]

instance T.ToJSON GetJsonValue where
  toJSON
    GetJsonValue
      { json = json_
      } =
      A.object
        [ "@type" A..= T.String "getJsonValue",
          "json" A..= json_
        ]
