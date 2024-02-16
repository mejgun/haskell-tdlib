module TD.Query.SetChatAccentColor
  (SetChatAccentColor(..)
  , defaultSetChatAccentColor
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes accent color and background custom emoji of a channel chat. Requires can_change_info administrator right. Returns 'TD.Data.Ok.Ok'
data SetChatAccentColor
  = SetChatAccentColor
    { chat_id                    :: Maybe Int -- ^ Chat identifier
    , accent_color_id            :: Maybe Int -- ^ Identifier of the accent color to use. The chat must have at least accentColor.min_channel_chat_boost_level boost level to pass the corresponding color
    , background_custom_emoji_id :: Maybe Int -- ^ Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none. Use chatBoostLevelFeatures.can_set_background_custom_emoji to check whether a custom emoji can be set
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatAccentColor where
  shortShow
    SetChatAccentColor
      { chat_id                    = chat_id_
      , accent_color_id            = accent_color_id_
      , background_custom_emoji_id = background_custom_emoji_id_
      }
        = "SetChatAccentColor"
          ++ I.cc
          [ "chat_id"                    `I.p` chat_id_
          , "accent_color_id"            `I.p` accent_color_id_
          , "background_custom_emoji_id" `I.p` background_custom_emoji_id_
          ]

instance AT.ToJSON SetChatAccentColor where
  toJSON
    SetChatAccentColor
      { chat_id                    = chat_id_
      , accent_color_id            = accent_color_id_
      , background_custom_emoji_id = background_custom_emoji_id_
      }
        = A.object
          [ "@type"                      A..= AT.String "setChatAccentColor"
          , "chat_id"                    A..= chat_id_
          , "accent_color_id"            A..= accent_color_id_
          , "background_custom_emoji_id" A..= fmap I.writeInt64  background_custom_emoji_id_
          ]

defaultSetChatAccentColor :: SetChatAccentColor
defaultSetChatAccentColor =
  SetChatAccentColor
    { chat_id                    = Nothing
    , accent_color_id            = Nothing
    , background_custom_emoji_id = Nothing
    }

