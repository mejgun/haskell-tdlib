module TD.Data.JsonValue
  (JsonValue(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import {-# SOURCE #-} qualified TD.Data.JsonObjectMember as JsonObjectMember

-- | Represents a JSON value
data JsonValue
  = JsonValueNull -- ^ Represents a null JSON value
  | JsonValueBoolean -- ^ Represents a boolean JSON value
    { value :: Maybe Bool -- ^ The value
    }
  | JsonValueNumber -- ^ Represents a numeric JSON value
    { _value :: Maybe Double -- ^ The value
    }
  | JsonValueString -- ^ Represents a string JSON value
    { __value :: Maybe T.Text -- ^ The value
    }
  | JsonValueArray -- ^ Represents a JSON array
    { values :: Maybe [JsonValue] -- ^ The list of array elements
    }
  | JsonValueObject -- ^ Represents a JSON object
    { members :: Maybe [JsonObjectMember.JsonObjectMember] -- ^ The list of object members
    }
  deriving (Eq, Show)

instance I.ShortShow JsonValue where
  shortShow JsonValueNull
      = "JsonValueNull"
  shortShow JsonValueBoolean
    { value = value_
    }
      = "JsonValueBoolean"
        ++ I.cc
        [ "value" `I.p` value_
        ]
  shortShow JsonValueNumber
    { _value = _value_
    }
      = "JsonValueNumber"
        ++ I.cc
        [ "_value" `I.p` _value_
        ]
  shortShow JsonValueString
    { __value = __value_
    }
      = "JsonValueString"
        ++ I.cc
        [ "__value" `I.p` __value_
        ]
  shortShow JsonValueArray
    { values = values_
    }
      = "JsonValueArray"
        ++ I.cc
        [ "values" `I.p` values_
        ]
  shortShow JsonValueObject
    { members = members_
    }
      = "JsonValueObject"
        ++ I.cc
        [ "members" `I.p` members_
        ]

instance AT.FromJSON JsonValue where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "jsonValueNull"    -> pure JsonValueNull
      "jsonValueBoolean" -> parseJsonValueBoolean v
      "jsonValueNumber"  -> parseJsonValueNumber v
      "jsonValueString"  -> parseJsonValueString v
      "jsonValueArray"   -> parseJsonValueArray v
      "jsonValueObject"  -> parseJsonValueObject v
      _                  -> mempty
    
    where
      parseJsonValueBoolean :: A.Value -> AT.Parser JsonValue
      parseJsonValueBoolean = A.withObject "JsonValueBoolean" $ \o -> do
        value_ <- o A..:?  "value"
        pure $ JsonValueBoolean
          { value = value_
          }
      parseJsonValueNumber :: A.Value -> AT.Parser JsonValue
      parseJsonValueNumber = A.withObject "JsonValueNumber" $ \o -> do
        _value_ <- o A..:?  "value"
        pure $ JsonValueNumber
          { _value = _value_
          }
      parseJsonValueString :: A.Value -> AT.Parser JsonValue
      parseJsonValueString = A.withObject "JsonValueString" $ \o -> do
        __value_ <- o A..:?  "value"
        pure $ JsonValueString
          { __value = __value_
          }
      parseJsonValueArray :: A.Value -> AT.Parser JsonValue
      parseJsonValueArray = A.withObject "JsonValueArray" $ \o -> do
        values_ <- o A..:?  "values"
        pure $ JsonValueArray
          { values = values_
          }
      parseJsonValueObject :: A.Value -> AT.Parser JsonValue
      parseJsonValueObject = A.withObject "JsonValueObject" $ \o -> do
        members_ <- o A..:?  "members"
        pure $ JsonValueObject
          { members = members_
          }
  parseJSON _ = mempty

instance AT.ToJSON JsonValue where
  toJSON JsonValueNull
      = A.object
        [ "@type" A..= AT.String "jsonValueNull"
        ]
  toJSON JsonValueBoolean
    { value = value_
    }
      = A.object
        [ "@type" A..= AT.String "jsonValueBoolean"
        , "value" A..= value_
        ]
  toJSON JsonValueNumber
    { _value = _value_
    }
      = A.object
        [ "@type" A..= AT.String "jsonValueNumber"
        , "value" A..= _value_
        ]
  toJSON JsonValueString
    { __value = __value_
    }
      = A.object
        [ "@type" A..= AT.String "jsonValueString"
        , "value" A..= __value_
        ]
  toJSON JsonValueArray
    { values = values_
    }
      = A.object
        [ "@type"  A..= AT.String "jsonValueArray"
        , "values" A..= values_
        ]
  toJSON JsonValueObject
    { members = members_
    }
      = A.object
        [ "@type"   A..= AT.String "jsonValueObject"
        , "members" A..= members_
        ]

