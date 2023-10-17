module TD.Data.LanguagePackStrings
  (LanguagePackStrings(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.LanguagePackString as LanguagePackString

data LanguagePackStrings
  = LanguagePackStrings -- ^ Contains a list of language pack strings
    { strings :: Maybe [LanguagePackString.LanguagePackString] -- ^ A list of language pack strings
    }
  deriving (Eq, Show)

instance I.ShortShow LanguagePackStrings where
  shortShow LanguagePackStrings
    { strings = strings_
    }
      = "LanguagePackStrings"
        ++ I.cc
        [ "strings" `I.p` strings_
        ]

instance AT.FromJSON LanguagePackStrings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "languagePackStrings" -> parseLanguagePackStrings v
      _                     -> mempty
    
    where
      parseLanguagePackStrings :: A.Value -> AT.Parser LanguagePackStrings
      parseLanguagePackStrings = A.withObject "LanguagePackStrings" $ \o -> do
        strings_ <- o A..:?  "strings"
        pure $ LanguagePackStrings
          { strings = strings_
          }
  parseJSON _ = mempty

