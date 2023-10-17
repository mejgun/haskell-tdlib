module TD.Data.OptionValue
  (OptionValue(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Represents the value of an option
data OptionValue
  = OptionValueBoolean -- ^ Represents a boolean option
    { value :: Maybe Bool -- ^ The value of the option
    }
  | OptionValueEmpty -- ^ Represents an unknown option or an option which has a default value
  | OptionValueInteger -- ^ Represents an integer option
    { _value :: Maybe Int -- ^ The value of the option
    }
  | OptionValueString -- ^ Represents a string option
    { __value :: Maybe T.Text -- ^ The value of the option
    }
  deriving (Eq, Show)

instance I.ShortShow OptionValue where
  shortShow OptionValueBoolean
    { value = value_
    }
      = "OptionValueBoolean"
        ++ I.cc
        [ "value" `I.p` value_
        ]
  shortShow OptionValueEmpty
      = "OptionValueEmpty"
  shortShow OptionValueInteger
    { _value = _value_
    }
      = "OptionValueInteger"
        ++ I.cc
        [ "_value" `I.p` _value_
        ]
  shortShow OptionValueString
    { __value = __value_
    }
      = "OptionValueString"
        ++ I.cc
        [ "__value" `I.p` __value_
        ]

instance AT.FromJSON OptionValue where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "optionValueBoolean" -> parseOptionValueBoolean v
      "optionValueEmpty"   -> pure OptionValueEmpty
      "optionValueInteger" -> parseOptionValueInteger v
      "optionValueString"  -> parseOptionValueString v
      _                    -> mempty
    
    where
      parseOptionValueBoolean :: A.Value -> AT.Parser OptionValue
      parseOptionValueBoolean = A.withObject "OptionValueBoolean" $ \o -> do
        value_ <- o A..:?  "value"
        pure $ OptionValueBoolean
          { value = value_
          }
      parseOptionValueInteger :: A.Value -> AT.Parser OptionValue
      parseOptionValueInteger = A.withObject "OptionValueInteger" $ \o -> do
        _value_ <- fmap I.readInt64 <$> o A..:?  "value"
        pure $ OptionValueInteger
          { _value = _value_
          }
      parseOptionValueString :: A.Value -> AT.Parser OptionValue
      parseOptionValueString = A.withObject "OptionValueString" $ \o -> do
        __value_ <- o A..:?  "value"
        pure $ OptionValueString
          { __value = __value_
          }
  parseJSON _ = mempty

instance AT.ToJSON OptionValue where
  toJSON OptionValueBoolean
    { value = value_
    }
      = A.object
        [ "@type" A..= AT.String "optionValueBoolean"
        , "value" A..= value_
        ]
  toJSON OptionValueEmpty
      = A.object
        [ "@type" A..= AT.String "optionValueEmpty"
        ]
  toJSON OptionValueInteger
    { _value = _value_
    }
      = A.object
        [ "@type" A..= AT.String "optionValueInteger"
        , "value" A..= fmap I.writeInt64  _value_
        ]
  toJSON OptionValueString
    { __value = __value_
    }
      = A.object
        [ "@type" A..= AT.String "optionValueString"
        , "value" A..= __value_
        ]

