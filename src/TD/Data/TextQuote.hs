module TD.Data.TextQuote
  (TextQuote(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data TextQuote
  = TextQuote -- ^ Describes manually or automatically chosen quote from another message
    { text      :: Maybe FormattedText.FormattedText -- ^ Text of the quote. Only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities can be present in the text
    , position  :: Maybe Int                         -- ^ Approximate quote position in the original message in UTF-16 code units as specified by the message sender
    , is_manual :: Maybe Bool                        -- ^ True, if the quote was manually chosen by the message sender
    }
  deriving (Eq, Show)

instance I.ShortShow TextQuote where
  shortShow TextQuote
    { text      = text_
    , position  = position_
    , is_manual = is_manual_
    }
      = "TextQuote"
        ++ I.cc
        [ "text"      `I.p` text_
        , "position"  `I.p` position_
        , "is_manual" `I.p` is_manual_
        ]

instance AT.FromJSON TextQuote where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "textQuote" -> parseTextQuote v
      _           -> mempty
    
    where
      parseTextQuote :: A.Value -> AT.Parser TextQuote
      parseTextQuote = A.withObject "TextQuote" $ \o -> do
        text_      <- o A..:?  "text"
        position_  <- o A..:?  "position"
        is_manual_ <- o A..:?  "is_manual"
        pure $ TextQuote
          { text      = text_
          , position  = position_
          , is_manual = is_manual_
          }
  parseJSON _ = mempty

