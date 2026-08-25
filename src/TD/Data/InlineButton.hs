module TD.Data.InlineButton
  ( InlineButton(..)    
  , defaultInlineButton 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import {-# SOURCE #-} qualified TD.Data.RichText as RichText
import qualified TD.Data.ButtonStyle as ButtonStyle
import qualified TD.Data.InlineKeyboardButtonType as InlineKeyboardButtonType

data InlineButton
  = InlineButton -- ^ Represents a button inside a rich message
    { text  :: Maybe RichText.RichText                                 -- ^ Text of the button; only richTexts, richTextPlain, and richTextCustomEmoji are allowed
    , style :: Maybe ButtonStyle.ButtonStyle                           -- ^ Style of the button
    , _type :: Maybe InlineKeyboardButtonType.InlineKeyboardButtonType -- ^ Type of the button; must be one of inlineKeyboardButtonTypeUrl, inlineKeyboardButtonTypeLoginUrl, inlineKeyboardButtonTypeWebApp, inlineKeyboardButtonTypeCallback, inlineKeyboardButtonTypeSwitchInline, inlineKeyboardButtonTypeUser, inlineKeyboardButtonTypeCopyText. Additionally, inlineKeyboardButtonTypeCallbackWithPassword and inlineKeyboardButtonTypeDisabled may be received in incoming messages. Regular users may use only inlineKeyboardButtonTypeUrl, inlineKeyboardButtonTypeUser and inlineKeyboardButtonTypeCopyText
    }
  deriving (Eq, Show)

instance I.ShortShow InlineButton where
  shortShow InlineButton
    { text  = text_
    , style = style_
    , _type = _type_
    }
      = "InlineButton"
        ++ I.cc
        [ "text"  `I.p` text_
        , "style" `I.p` style_
        , "_type" `I.p` _type_
        ]

instance AT.FromJSON InlineButton where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inlineButton" -> parseInlineButton v
      _              -> mempty
    
    where
      parseInlineButton :: A.Value -> AT.Parser InlineButton
      parseInlineButton = A.withObject "InlineButton" $ \o -> do
        text_  <- o A..:?  "text"
        style_ <- o A..:?  "style"
        _type_ <- o A..:?  "type"
        pure $ InlineButton
          { text  = text_
          , style = style_
          , _type = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON InlineButton where
  toJSON InlineButton
    { text  = text_
    , style = style_
    , _type = _type_
    }
      = A.object
        [ "@type" A..= AT.String "inlineButton"
        , "text"  A..= text_
        , "style" A..= style_
        , "type"  A..= _type_
        ]

defaultInlineButton :: InlineButton
defaultInlineButton =
  InlineButton
    { text  = Nothing
    , style = Nothing
    , _type = Nothing
    }

