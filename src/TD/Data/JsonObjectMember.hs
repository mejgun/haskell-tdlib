{-# LANGUAGE OverloadedStrings #-}

module TD.Data.JsonObjectMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified TD.Data.JsonValue as JsonValue
import qualified Utils as U

data JsonObjectMember = -- | Represents one member of a JSON object @key Member's key @value Member's value
  JsonObjectMember
  { -- |
    value :: Maybe JsonValue.JsonValue,
    -- |
    key :: Maybe String
  }
  deriving (Eq)

instance Show JsonObjectMember where
  show
    JsonObjectMember
      { value = value,
        key = key
      } =
      "JsonObjectMember"
        ++ U.cc
          [ U.p "value" value,
            U.p "key" key
          ]

instance T.FromJSON JsonObjectMember where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "jsonObjectMember" -> parseJsonObjectMember v
      _ -> mempty
    where
      parseJsonObjectMember :: A.Value -> T.Parser JsonObjectMember
      parseJsonObjectMember = A.withObject "JsonObjectMember" $ \o -> do
        value_ <- o A..:? "value"
        key_ <- o A..:? "key"
        return $ JsonObjectMember {value = value_, key = key_}
  parseJSON _ = mempty

instance T.ToJSON JsonObjectMember where
  toJSON
    JsonObjectMember
      { value = value,
        key = key
      } =
      A.object
        [ "@type" A..= T.String "jsonObjectMember",
          "value" A..= value,
          "key" A..= key
        ]
