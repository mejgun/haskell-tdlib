module TD.Data.InputTextQuote
  ( InputTextQuote(..)    
  , defaultInputTextQuote 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data InputTextQuote
  = InputTextQuote -- ^ Describes manually chosen quote from another message
    { text     :: Maybe FormattedText.FormattedText -- ^ Text of the quote; 0-getOption("message_reply_quote_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities are allowed to be kept and must be kept in the quote
    , position :: Maybe Int                         -- ^ Quote position in the original message in UTF-16 code units
    }
  deriving (Eq, Show)

instance I.ShortShow InputTextQuote where
  shortShow InputTextQuote
    { text     = text_
    , position = position_
    }
      = "InputTextQuote"
        ++ I.cc
        [ "text"     `I.p` text_
        , "position" `I.p` position_
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
        text_     <- o A..:?  "text"
        position_ <- o A..:?  "position"
        pure $ InputTextQuote
          { text     = text_
          , position = position_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputTextQuote where
  toJSON InputTextQuote
    { text     = text_
    , position = position_
    }
      = A.object
        [ "@type"    A..= AT.String "inputTextQuote"
        , "text"     A..= text_
        , "position" A..= position_
        ]

defaultInputTextQuote :: InputTextQuote
defaultInputTextQuote =
  InputTextQuote
    { text     = Nothing
    , position = Nothing
    }

