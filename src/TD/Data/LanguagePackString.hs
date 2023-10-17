module TD.Data.LanguagePackString
  ( LanguagePackString(..)    
  , defaultLanguagePackString 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.LanguagePackStringValue as LanguagePackStringValue

data LanguagePackString
  = LanguagePackString -- ^ Represents one language pack string
    { key   :: Maybe T.Text                                          -- ^ String key
    , value :: Maybe LanguagePackStringValue.LanguagePackStringValue -- ^ String value; pass null if the string needs to be taken from the built-in English language pack
    }
  deriving (Eq, Show)

instance I.ShortShow LanguagePackString where
  shortShow LanguagePackString
    { key   = key_
    , value = value_
    }
      = "LanguagePackString"
        ++ I.cc
        [ "key"   `I.p` key_
        , "value" `I.p` value_
        ]

instance AT.FromJSON LanguagePackString where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "languagePackString" -> parseLanguagePackString v
      _                    -> mempty
    
    where
      parseLanguagePackString :: A.Value -> AT.Parser LanguagePackString
      parseLanguagePackString = A.withObject "LanguagePackString" $ \o -> do
        key_   <- o A..:?  "key"
        value_ <- o A..:?  "value"
        pure $ LanguagePackString
          { key   = key_
          , value = value_
          }
  parseJSON _ = mempty

instance AT.ToJSON LanguagePackString where
  toJSON LanguagePackString
    { key   = key_
    , value = value_
    }
      = A.object
        [ "@type" A..= AT.String "languagePackString"
        , "key"   A..= key_
        , "value" A..= value_
        ]

defaultLanguagePackString :: LanguagePackString
defaultLanguagePackString =
  LanguagePackString
    { key   = Nothing
    , value = Nothing
    }

