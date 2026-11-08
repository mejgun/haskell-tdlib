module TD.Data.TextRanges
  (TextRanges(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TextRange as TextRange

data TextRanges
  = TextRanges -- ^ Contains a list of text parts
    { ranges :: Maybe [TextRange.TextRange] -- ^ List of text parts
    }
  deriving (Eq, Show)

instance I.ShortShow TextRanges where
  shortShow TextRanges
    { ranges = ranges_
    }
      = "TextRanges"
        ++ I.cc
        [ "ranges" `I.p` ranges_
        ]

instance AT.FromJSON TextRanges where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "textRanges" -> parseTextRanges v
      _            -> mempty
    
    where
      parseTextRanges :: A.Value -> AT.Parser TextRanges
      parseTextRanges = A.withObject "TextRanges" $ \o -> do
        ranges_ <- o A..:?  "ranges"
        pure $ TextRanges
          { ranges = ranges_
          }
  parseJSON _ = mempty

