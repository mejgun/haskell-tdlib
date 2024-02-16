module TD.Query.SetChatProfileAccentColor
  (SetChatProfileAccentColor(..)
  , defaultSetChatProfileAccentColor
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes accent color and background custom emoji for profile of a supergroup or channel chat. Requires can_change_info administrator right. Returns 'TD.Data.Ok.Ok'
data SetChatProfileAccentColor
  = SetChatProfileAccentColor
    { chat_id                            :: Maybe Int -- ^ Chat identifier
    , profile_accent_color_id            :: Maybe Int -- ^ Identifier of the accent color to use for profile; pass -1 if none. The chat must have at least profileAccentColor.min_supergroup_chat_boost_level for supergroups or profileAccentColor.min_channel_chat_boost_level for channels boost level to pass the corresponding color
    , profile_background_custom_emoji_id :: Maybe Int -- ^ Identifier of a custom emoji to be shown on the chat's profile photo background; 0 if none. Use chatBoostLevelFeatures.can_set_profile_background_custom_emoji to check whether a custom emoji can be set
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatProfileAccentColor where
  shortShow
    SetChatProfileAccentColor
      { chat_id                            = chat_id_
      , profile_accent_color_id            = profile_accent_color_id_
      , profile_background_custom_emoji_id = profile_background_custom_emoji_id_
      }
        = "SetChatProfileAccentColor"
          ++ I.cc
          [ "chat_id"                            `I.p` chat_id_
          , "profile_accent_color_id"            `I.p` profile_accent_color_id_
          , "profile_background_custom_emoji_id" `I.p` profile_background_custom_emoji_id_
          ]

instance AT.ToJSON SetChatProfileAccentColor where
  toJSON
    SetChatProfileAccentColor
      { chat_id                            = chat_id_
      , profile_accent_color_id            = profile_accent_color_id_
      , profile_background_custom_emoji_id = profile_background_custom_emoji_id_
      }
        = A.object
          [ "@type"                              A..= AT.String "setChatProfileAccentColor"
          , "chat_id"                            A..= chat_id_
          , "profile_accent_color_id"            A..= profile_accent_color_id_
          , "profile_background_custom_emoji_id" A..= fmap I.writeInt64  profile_background_custom_emoji_id_
          ]

defaultSetChatProfileAccentColor :: SetChatProfileAccentColor
defaultSetChatProfileAccentColor =
  SetChatProfileAccentColor
    { chat_id                            = Nothing
    , profile_accent_color_id            = Nothing
    , profile_background_custom_emoji_id = Nothing
    }

