module TD.Data.TextQuote
  (TextQuote(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.RichText as RichText

data TextQuote
  = TextQuote -- ^ Describes manually or automatically chosen quote from another message
    { text       :: Maybe FormattedText.FormattedText -- ^ Text of the quote. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities can be present in the text. May be empty if the quote was chosen from a rich message
    , rich_texts :: Maybe [RichText.RichText]         -- ^ Rich text of the quote if it was chosen from a rich message; empty if the quote wasn't chosen from a rich message. Only richTextPlain, richTextBold, richTextItalic, richTextUnderline, richTextStrikethrough, richTextSpoiler, richTextSubscript, richTextSuperscript, richTextDateTime, richTextCustomEmoji, richTextMathematicalExpression, and richTexts can be present in the texts
    , position   :: Maybe Int                         -- ^ Approximate quote position in the original message in UTF-16 code units as specified by the message sender. For quotes from rich messages, it is the position in the text formed by joining plain texts of all quotable texts of the message, separated by line feeds
    , is_manual  :: Maybe Bool                        -- ^ True, if the quote was manually chosen by the message sender
    }
  deriving (Eq, Show)

instance I.ShortShow TextQuote where
  shortShow TextQuote
    { text       = text_
    , rich_texts = rich_texts_
    , position   = position_
    , is_manual  = is_manual_
    }
      = "TextQuote"
        ++ I.cc
        [ "text"       `I.p` text_
        , "rich_texts" `I.p` rich_texts_
        , "position"   `I.p` position_
        , "is_manual"  `I.p` is_manual_
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
        text_       <- o A..:?  "text"
        rich_texts_ <- o A..:?  "rich_texts"
        position_   <- o A..:?  "position"
        is_manual_  <- o A..:?  "is_manual"
        pure $ TextQuote
          { text       = text_
          , rich_texts = rich_texts_
          , position   = position_
          , is_manual  = is_manual_
          }
  parseJSON _ = mempty

