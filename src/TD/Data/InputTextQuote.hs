module TD.Data.InputTextQuote
  ( InputTextQuote(..)    
  , defaultInputTextQuote 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.RichText as RichText

data InputTextQuote
  = InputTextQuote -- ^ Describes manually chosen quote from another message
    { text       :: Maybe FormattedText.FormattedText -- ^ Text of the quote; 0-getOption("message_reply_quote_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed to be kept and must be kept in the quote. Ignored if rich_texts are non-empty
    , rich_texts :: Maybe [RichText.RichText]         -- ^ Quote from a rich message; pass an empty array if the quote isn't chosen from a rich message. Must contain one element for each quoted text of the message in the order of their appearance. The first and the last elements can contain only a part of the corresponding text; all other elements must contain the whole text. Formatting of the quoted parts must be kept. Mathematical expressions must be quoted entirely. Buttons in pageBlockButtonRow, anchors and dividers can't be quoted. There can be up to 32 quoted texts with total length up to getOption("message_reply_quote_length_max") characters
    , position   :: Maybe Int                         -- ^ Quote position in the original message in UTF-16 code units. For quotes from rich messages, it is the position in the text formed by joining plain texts of all quotable texts of the message, separated by line feeds
    }
  deriving (Eq, Show)

instance I.ShortShow InputTextQuote where
  shortShow InputTextQuote
    { text       = text_
    , rich_texts = rich_texts_
    , position   = position_
    }
      = "InputTextQuote"
        ++ I.cc
        [ "text"       `I.p` text_
        , "rich_texts" `I.p` rich_texts_
        , "position"   `I.p` position_
        ]

instance AT.FromJSON InputTextQuote where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputTextQuote" -> parseInputTextQuote v
      _                -> mempty
    
    where
      parseInputTextQuote :: A.Value -> AT.Parser InputTextQuote
      parseInputTextQuote = A.withObject "InputTextQuote" $ \o -> do
        text_       <- o A..:?  "text"
        rich_texts_ <- o A..:?  "rich_texts"
        position_   <- o A..:?  "position"
        pure $ InputTextQuote
          { text       = text_
          , rich_texts = rich_texts_
          , position   = position_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputTextQuote where
  toJSON InputTextQuote
    { text       = text_
    , rich_texts = rich_texts_
    , position   = position_
    }
      = A.object
        [ "@type"      A..= AT.String "inputTextQuote"
        , "text"       A..= text_
        , "rich_texts" A..= rich_texts_
        , "position"   A..= position_
        ]

defaultInputTextQuote :: InputTextQuote
defaultInputTextQuote =
  InputTextQuote
    { text       = Nothing
    , rich_texts = Nothing
    , position   = Nothing
    }

