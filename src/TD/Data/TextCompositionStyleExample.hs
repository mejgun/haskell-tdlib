module TD.Data.TextCompositionStyleExample
  (TextCompositionStyleExample(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data TextCompositionStyleExample
  = TextCompositionStyleExample -- ^ Contains an example of text composition style usage
    { source_text :: Maybe FormattedText.FormattedText -- ^ Source text
    , result_text :: Maybe FormattedText.FormattedText -- ^ The text after the style was applied to the source text
    }
  deriving (Eq, Show)

instance I.ShortShow TextCompositionStyleExample where
  shortShow TextCompositionStyleExample
    { source_text = source_text_
    , result_text = result_text_
    }
      = "TextCompositionStyleExample"
        ++ I.cc
        [ "source_text" `I.p` source_text_
        , "result_text" `I.p` result_text_
        ]

instance AT.FromJSON TextCompositionStyleExample where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "textCompositionStyleExample" -> parseTextCompositionStyleExample v
      _                             -> mempty
    
    where
      parseTextCompositionStyleExample :: A.Value -> AT.Parser TextCompositionStyleExample
      parseTextCompositionStyleExample = A.withObject "TextCompositionStyleExample" $ \o -> do
        source_text_ <- o A..:?  "source_text"
        result_text_ <- o A..:?  "result_text"
        pure $ TextCompositionStyleExample
          { source_text = source_text_
          , result_text = result_text_
          }
  parseJSON _ = mempty

