{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.LanguagePackStringValue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents the value of a string in a language pack
data LanguagePackStringValue
  = -- | An ordinary language pack string @value String value
    LanguagePackStringValueOrdinary
      { -- |
        value :: Maybe String
      }
  | -- | A language pack string which has different forms based on the number of some object it mentions. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more information
    LanguagePackStringValuePluralized
      { -- | Default value
        other_value :: Maybe String,
        -- | Value for many objects
        many_value :: Maybe String,
        -- | Value for few objects
        few_value :: Maybe String,
        -- | Value for two objects
        two_value :: Maybe String,
        -- | Value for one object
        one_value :: Maybe String,
        -- | Value for zero objects
        zero_value :: Maybe String
      }
  | -- | A deleted language pack string, the value must be taken from the built-in English language pack
    LanguagePackStringValueDeleted
  deriving (Eq)

instance Show LanguagePackStringValue where
  show
    LanguagePackStringValueOrdinary
      { value = value_
      } =
      "LanguagePackStringValueOrdinary"
        ++ U.cc
          [ U.p "value" value_
          ]
  show
    LanguagePackStringValuePluralized
      { other_value = other_value_,
        many_value = many_value_,
        few_value = few_value_,
        two_value = two_value_,
        one_value = one_value_,
        zero_value = zero_value_
      } =
      "LanguagePackStringValuePluralized"
        ++ U.cc
          [ U.p "other_value" other_value_,
            U.p "many_value" many_value_,
            U.p "few_value" few_value_,
            U.p "two_value" two_value_,
            U.p "one_value" one_value_,
            U.p "zero_value" zero_value_
          ]
  show LanguagePackStringValueDeleted =
    "LanguagePackStringValueDeleted"
      ++ U.cc
        []

instance T.FromJSON LanguagePackStringValue where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "languagePackStringValueOrdinary" -> parseLanguagePackStringValueOrdinary v
      "languagePackStringValuePluralized" -> parseLanguagePackStringValuePluralized v
      "languagePackStringValueDeleted" -> parseLanguagePackStringValueDeleted v
      _ -> mempty
    where
      parseLanguagePackStringValueOrdinary :: A.Value -> T.Parser LanguagePackStringValue
      parseLanguagePackStringValueOrdinary = A.withObject "LanguagePackStringValueOrdinary" $ \o -> do
        value_ <- o A..:? "value"
        return $ LanguagePackStringValueOrdinary {value = value_}

      parseLanguagePackStringValuePluralized :: A.Value -> T.Parser LanguagePackStringValue
      parseLanguagePackStringValuePluralized = A.withObject "LanguagePackStringValuePluralized" $ \o -> do
        other_value_ <- o A..:? "other_value"
        many_value_ <- o A..:? "many_value"
        few_value_ <- o A..:? "few_value"
        two_value_ <- o A..:? "two_value"
        one_value_ <- o A..:? "one_value"
        zero_value_ <- o A..:? "zero_value"
        return $ LanguagePackStringValuePluralized {other_value = other_value_, many_value = many_value_, few_value = few_value_, two_value = two_value_, one_value = one_value_, zero_value = zero_value_}

      parseLanguagePackStringValueDeleted :: A.Value -> T.Parser LanguagePackStringValue
      parseLanguagePackStringValueDeleted = A.withObject "LanguagePackStringValueDeleted" $ \_ -> return LanguagePackStringValueDeleted
  parseJSON _ = mempty

instance T.ToJSON LanguagePackStringValue where
  toJSON
    LanguagePackStringValueOrdinary
      { value = value_
      } =
      A.object
        [ "@type" A..= T.String "languagePackStringValueOrdinary",
          "value" A..= value_
        ]
  toJSON
    LanguagePackStringValuePluralized
      { other_value = other_value_,
        many_value = many_value_,
        few_value = few_value_,
        two_value = two_value_,
        one_value = one_value_,
        zero_value = zero_value_
      } =
      A.object
        [ "@type" A..= T.String "languagePackStringValuePluralized",
          "other_value" A..= other_value_,
          "many_value" A..= many_value_,
          "few_value" A..= few_value_,
          "two_value" A..= two_value_,
          "one_value" A..= one_value_,
          "zero_value" A..= zero_value_
        ]
  toJSON LanguagePackStringValueDeleted =
    A.object
      [ "@type" A..= T.String "languagePackStringValueDeleted"
      ]
