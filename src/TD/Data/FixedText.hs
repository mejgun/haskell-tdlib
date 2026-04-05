module TD.Data.FixedText
  (FixedText(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.DiffText as DiffText

data FixedText
  = FixedText -- ^ A text fixed using fixTextWithAi
    { text      :: Maybe FormattedText.FormattedText -- ^ The resulting text
    , diff_text :: Maybe DiffText.DiffText           -- ^ Changes made to the original text
    }
  deriving (Eq, Show)

instance I.ShortShow FixedText where
  shortShow FixedText
    { text      = text_
    , diff_text = diff_text_
    }
      = "FixedText"
        ++ I.cc
        [ "text"      `I.p` text_
        , "diff_text" `I.p` diff_text_
        ]

instance AT.FromJSON FixedText where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "fixedText" -> parseFixedText v
      _           -> mempty
    
    where
      parseFixedText :: A.Value -> AT.Parser FixedText
      parseFixedText = A.withObject "FixedText" $ \o -> do
        text_      <- o A..:?  "text"
        diff_text_ <- o A..:?  "diff_text"
        pure $ FixedText
          { text      = text_
          , diff_text = diff_text_
          }
  parseJSON _ = mempty

