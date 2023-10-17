module TD.Data.LanguagePackStringValue
  (LanguagePackStringValue(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Represents the value of a string in a language pack
data LanguagePackStringValue
  = LanguagePackStringValueOrdinary -- ^ An ordinary language pack string
    { value :: Maybe T.Text -- ^ String value
    }
  | LanguagePackStringValuePluralized -- ^ A language pack string which has different forms based on the number of some object it mentions. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more information
    { zero_value  :: Maybe T.Text -- ^ Value for zero objects
    , one_value   :: Maybe T.Text -- ^ Value for one object
    , two_value   :: Maybe T.Text -- ^ Value for two objects
    , few_value   :: Maybe T.Text -- ^ Value for few objects
    , many_value  :: Maybe T.Text -- ^ Value for many objects
    , other_value :: Maybe T.Text -- ^ Default value
    }
  | LanguagePackStringValueDeleted -- ^ A deleted language pack string, the value must be taken from the built-in English language pack
  deriving (Eq, Show)

instance I.ShortShow LanguagePackStringValue where
  shortShow LanguagePackStringValueOrdinary
    { value = value_
    }
      = "LanguagePackStringValueOrdinary"
        ++ I.cc
        [ "value" `I.p` value_
        ]
  shortShow LanguagePackStringValuePluralized
    { zero_value  = zero_value_
    , one_value   = one_value_
    , two_value   = two_value_
    , few_value   = few_value_
    , many_value  = many_value_
    , other_value = other_value_
    }
      = "LanguagePackStringValuePluralized"
        ++ I.cc
        [ "zero_value"  `I.p` zero_value_
        , "one_value"   `I.p` one_value_
        , "two_value"   `I.p` two_value_
        , "few_value"   `I.p` few_value_
        , "many_value"  `I.p` many_value_
        , "other_value" `I.p` other_value_
        ]
  shortShow LanguagePackStringValueDeleted
      = "LanguagePackStringValueDeleted"

instance AT.FromJSON LanguagePackStringValue where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "languagePackStringValueOrdinary"   -> parseLanguagePackStringValueOrdinary v
      "languagePackStringValuePluralized" -> parseLanguagePackStringValuePluralized v
      "languagePackStringValueDeleted"    -> pure LanguagePackStringValueDeleted
      _                                   -> mempty
    
    where
      parseLanguagePackStringValueOrdinary :: A.Value -> AT.Parser LanguagePackStringValue
      parseLanguagePackStringValueOrdinary = A.withObject "LanguagePackStringValueOrdinary" $ \o -> do
        value_ <- o A..:?  "value"
        pure $ LanguagePackStringValueOrdinary
          { value = value_
          }
      parseLanguagePackStringValuePluralized :: A.Value -> AT.Parser LanguagePackStringValue
      parseLanguagePackStringValuePluralized = A.withObject "LanguagePackStringValuePluralized" $ \o -> do
        zero_value_  <- o A..:?  "zero_value"
        one_value_   <- o A..:?  "one_value"
        two_value_   <- o A..:?  "two_value"
        few_value_   <- o A..:?  "few_value"
        many_value_  <- o A..:?  "many_value"
        other_value_ <- o A..:?  "other_value"
        pure $ LanguagePackStringValuePluralized
          { zero_value  = zero_value_
          , one_value   = one_value_
          , two_value   = two_value_
          , few_value   = few_value_
          , many_value  = many_value_
          , other_value = other_value_
          }
  parseJSON _ = mempty

instance AT.ToJSON LanguagePackStringValue where
  toJSON LanguagePackStringValueOrdinary
    { value = value_
    }
      = A.object
        [ "@type" A..= AT.String "languagePackStringValueOrdinary"
        , "value" A..= value_
        ]
  toJSON LanguagePackStringValuePluralized
    { zero_value  = zero_value_
    , one_value   = one_value_
    , two_value   = two_value_
    , few_value   = few_value_
    , many_value  = many_value_
    , other_value = other_value_
    }
      = A.object
        [ "@type"       A..= AT.String "languagePackStringValuePluralized"
        , "zero_value"  A..= zero_value_
        , "one_value"   A..= one_value_
        , "two_value"   A..= two_value_
        , "few_value"   A..= few_value_
        , "many_value"  A..= many_value_
        , "other_value" A..= other_value_
        ]
  toJSON LanguagePackStringValueDeleted
      = A.object
        [ "@type" A..= AT.String "languagePackStringValueDeleted"
        ]

