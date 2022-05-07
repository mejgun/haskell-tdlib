{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.OptionValue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents the value of an option
data OptionValue
  = -- | Represents a boolean option @value The value of the option
    OptionValueBoolean
      { -- |
        value :: Maybe Bool
      }
  | -- | Represents an unknown option or an option which has a default value
    OptionValueEmpty
  | -- | Represents an integer option @value The value of the option
    OptionValueInteger
      { -- |
        _value :: Maybe Int
      }
  | -- | Represents a string option @value The value of the option
    OptionValueString
      { -- |
        __value :: Maybe String
      }
  deriving (Eq)

instance Show OptionValue where
  show
    OptionValueBoolean
      { value = value
      } =
      "OptionValueBoolean"
        ++ U.cc
          [ U.p "value" value
          ]
  show OptionValueEmpty =
    "OptionValueEmpty"
      ++ U.cc
        []
  show
    OptionValueInteger
      { _value = _value
      } =
      "OptionValueInteger"
        ++ U.cc
          [ U.p "_value" _value
          ]
  show
    OptionValueString
      { __value = __value
      } =
      "OptionValueString"
        ++ U.cc
          [ U.p "__value" __value
          ]

instance T.FromJSON OptionValue where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "optionValueBoolean" -> parseOptionValueBoolean v
      "optionValueEmpty" -> parseOptionValueEmpty v
      "optionValueInteger" -> parseOptionValueInteger v
      "optionValueString" -> parseOptionValueString v
      _ -> fail ""
    where
      parseOptionValueBoolean :: A.Value -> T.Parser OptionValue
      parseOptionValueBoolean = A.withObject "OptionValueBoolean" $ \o -> do
        value_ <- o A..:? "value"
        return $ OptionValueBoolean {value = value_}

      parseOptionValueEmpty :: A.Value -> T.Parser OptionValue
      parseOptionValueEmpty = A.withObject "OptionValueEmpty" $ \o -> do
        return $ OptionValueEmpty {}

      parseOptionValueInteger :: A.Value -> T.Parser OptionValue
      parseOptionValueInteger = A.withObject "OptionValueInteger" $ \o -> do
        _value_ <- mconcat [o A..:? "value", U.rm <$> (o A..: "value" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ OptionValueInteger {_value = _value_}

      parseOptionValueString :: A.Value -> T.Parser OptionValue
      parseOptionValueString = A.withObject "OptionValueString" $ \o -> do
        __value_ <- o A..:? "value"
        return $ OptionValueString {__value = __value_}
  parseJSON _ = fail ""

instance T.ToJSON OptionValue where
  toJSON
    OptionValueBoolean
      { value = value
      } =
      A.object
        [ "@type" A..= T.String "optionValueBoolean",
          "value" A..= value
        ]
  toJSON OptionValueEmpty =
    A.object
      [ "@type" A..= T.String "optionValueEmpty"
      ]
  toJSON
    OptionValueInteger
      { _value = _value
      } =
      A.object
        [ "@type" A..= T.String "optionValueInteger",
          "value" A..= _value
        ]
  toJSON
    OptionValueString
      { __value = __value
      } =
      A.object
        [ "@type" A..= T.String "optionValueString",
          "value" A..= __value
        ]
