module TD.Data.FactCheck
  (FactCheck(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified Data.Text as T

data FactCheck
  = FactCheck -- ^ Describes a fact-check added to the message by an independent checker
    { text         :: Maybe FormattedText.FormattedText -- ^ Text of the fact-check
    , country_code :: Maybe T.Text                      -- ^ A two-letter ISO 3166-1 alpha-2 country code of the country for which the fact-check is shown
    }
  deriving (Eq, Show)

instance I.ShortShow FactCheck where
  shortShow FactCheck
    { text         = text_
    , country_code = country_code_
    }
      = "FactCheck"
        ++ I.cc
        [ "text"         `I.p` text_
        , "country_code" `I.p` country_code_
        ]

instance AT.FromJSON FactCheck where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "factCheck" -> parseFactCheck v
      _           -> mempty
    
    where
      parseFactCheck :: A.Value -> AT.Parser FactCheck
      parseFactCheck = A.withObject "FactCheck" $ \o -> do
        text_         <- o A..:?  "text"
        country_code_ <- o A..:?  "country_code"
        pure $ FactCheck
          { text         = text_
          , country_code = country_code_
          }
  parseJSON _ = mempty

