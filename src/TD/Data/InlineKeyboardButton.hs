module TD.Data.InlineKeyboardButton
  ( InlineKeyboardButton(..)    
  , defaultInlineKeyboardButton 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ButtonStyle as ButtonStyle
import qualified TD.Data.InlineKeyboardButtonType as InlineKeyboardButtonType

data InlineKeyboardButton
  = InlineKeyboardButton -- ^ Represents a single button in an inline keyboard
    { text                 :: Maybe T.Text                                            -- ^ Text of the button
    , icon_custom_emoji_id :: Maybe Int                                               -- ^ Identifier of the custom emoji that must be shown on the button; 0 if none
    , style                :: Maybe ButtonStyle.ButtonStyle                           -- ^ Style of the button
    , _type                :: Maybe InlineKeyboardButtonType.InlineKeyboardButtonType -- ^ Type of the button
    }
  deriving (Eq, Show)

instance I.ShortShow InlineKeyboardButton where
  shortShow InlineKeyboardButton
    { text                 = text_
    , icon_custom_emoji_id = icon_custom_emoji_id_
    , style                = style_
    , _type                = _type_
    }
      = "InlineKeyboardButton"
        ++ I.cc
        [ "text"                 `I.p` text_
        , "icon_custom_emoji_id" `I.p` icon_custom_emoji_id_
        , "style"                `I.p` style_
        , "_type"                `I.p` _type_
        ]

instance AT.FromJSON InlineKeyboardButton where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inlineKeyboardButton" -> parseInlineKeyboardButton v
      _                      -> mempty
    
    where
      parseInlineKeyboardButton :: A.Value -> AT.Parser InlineKeyboardButton
      parseInlineKeyboardButton = A.withObject "InlineKeyboardButton" $ \o -> do
        text_                 <- o A..:?                       "text"
        icon_custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "icon_custom_emoji_id"
        style_                <- o A..:?                       "style"
        _type_                <- o A..:?                       "type"
        pure $ InlineKeyboardButton
          { text                 = text_
          , icon_custom_emoji_id = icon_custom_emoji_id_
          , style                = style_
          , _type                = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON InlineKeyboardButton where
  toJSON InlineKeyboardButton
    { text                 = text_
    , icon_custom_emoji_id = icon_custom_emoji_id_
    , style                = style_
    , _type                = _type_
    }
      = A.object
        [ "@type"                A..= AT.String "inlineKeyboardButton"
        , "text"                 A..= text_
        , "icon_custom_emoji_id" A..= fmap I.writeInt64  icon_custom_emoji_id_
        , "style"                A..= style_
        , "type"                 A..= _type_
        ]

defaultInlineKeyboardButton :: InlineKeyboardButton
defaultInlineKeyboardButton =
  InlineKeyboardButton
    { text                 = Nothing
    , icon_custom_emoji_id = Nothing
    , style                = Nothing
    , _type                = Nothing
    }

