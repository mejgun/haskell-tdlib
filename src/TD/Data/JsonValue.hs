{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.JsonValue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified TD.Data.JsonObjectMember as JsonObjectMember
import qualified Utils as U

-- | Represents a JSON value
data JsonValue
  = -- | Represents a null JSON value
    JsonValueNull
  | -- | Represents a boolean JSON value @value The value
    JsonValueBoolean
      { -- |
        value :: Maybe Bool
      }
  | -- | Represents a numeric JSON value @value The value
    JsonValueNumber
      { -- |
        _value :: Maybe Float
      }
  | -- | Represents a string JSON value @value The value
    JsonValueString
      { -- |
        __value :: Maybe String
      }
  | -- | Represents a JSON array @values The list of array elements
    JsonValueArray
      { -- |
        values :: Maybe [JsonValue]
      }
  | -- | Represents a JSON object @members The list of object members
    JsonValueObject
      { -- |
        members :: Maybe [JsonObjectMember.JsonObjectMember]
      }
  deriving (Eq)

instance Show JsonValue where
  show JsonValueNull =
    "JsonValueNull"
      ++ U.cc
        []
  show
    JsonValueBoolean
      { value = value_
      } =
      "JsonValueBoolean"
        ++ U.cc
          [ U.p "value" value_
          ]
  show
    JsonValueNumber
      { _value = _value_
      } =
      "JsonValueNumber"
        ++ U.cc
          [ U.p "_value" _value_
          ]
  show
    JsonValueString
      { __value = __value_
      } =
      "JsonValueString"
        ++ U.cc
          [ U.p "__value" __value_
          ]
  show
    JsonValueArray
      { values = values_
      } =
      "JsonValueArray"
        ++ U.cc
          [ U.p "values" values_
          ]
  show
    JsonValueObject
      { members = members_
      } =
      "JsonValueObject"
        ++ U.cc
          [ U.p "members" members_
          ]

instance T.FromJSON JsonValue where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "jsonValueNull" -> parseJsonValueNull v
      "jsonValueBoolean" -> parseJsonValueBoolean v
      "jsonValueNumber" -> parseJsonValueNumber v
      "jsonValueString" -> parseJsonValueString v
      "jsonValueArray" -> parseJsonValueArray v
      "jsonValueObject" -> parseJsonValueObject v
      _ -> mempty
    where
      parseJsonValueNull :: A.Value -> T.Parser JsonValue
      parseJsonValueNull = A.withObject "JsonValueNull" $ \_ -> return JsonValueNull

      parseJsonValueBoolean :: A.Value -> T.Parser JsonValue
      parseJsonValueBoolean = A.withObject "JsonValueBoolean" $ \o -> do
        value_ <- o A..:? "value"
        return $ JsonValueBoolean {value = value_}

      parseJsonValueNumber :: A.Value -> T.Parser JsonValue
      parseJsonValueNumber = A.withObject "JsonValueNumber" $ \o -> do
        _value_ <- o A..:? "value"
        return $ JsonValueNumber {_value = _value_}

      parseJsonValueString :: A.Value -> T.Parser JsonValue
      parseJsonValueString = A.withObject "JsonValueString" $ \o -> do
        __value_ <- o A..:? "value"
        return $ JsonValueString {__value = __value_}

      parseJsonValueArray :: A.Value -> T.Parser JsonValue
      parseJsonValueArray = A.withObject "JsonValueArray" $ \o -> do
        values_ <- o A..:? "values"
        return $ JsonValueArray {values = values_}

      parseJsonValueObject :: A.Value -> T.Parser JsonValue
      parseJsonValueObject = A.withObject "JsonValueObject" $ \o -> do
        members_ <- o A..:? "members"
        return $ JsonValueObject {members = members_}
  parseJSON _ = mempty

instance T.ToJSON JsonValue where
  toJSON JsonValueNull =
    A.object
      [ "@type" A..= T.String "jsonValueNull"
      ]
  toJSON
    JsonValueBoolean
      { value = value_
      } =
      A.object
        [ "@type" A..= T.String "jsonValueBoolean",
          "value" A..= value_
        ]
  toJSON
    JsonValueNumber
      { _value = _value_
      } =
      A.object
        [ "@type" A..= T.String "jsonValueNumber",
          "value" A..= _value_
        ]
  toJSON
    JsonValueString
      { __value = __value_
      } =
      A.object
        [ "@type" A..= T.String "jsonValueString",
          "value" A..= __value_
        ]
  toJSON
    JsonValueArray
      { values = values_
      } =
      A.object
        [ "@type" A..= T.String "jsonValueArray",
          "values" A..= values_
        ]
  toJSON
    JsonValueObject
      { members = members_
      } =
      A.object
        [ "@type" A..= T.String "jsonValueObject",
          "members" A..= members_
        ]
