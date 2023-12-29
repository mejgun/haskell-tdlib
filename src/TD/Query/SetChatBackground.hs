module TD.Query.SetChatBackground
  (SetChatBackground(..)
  , defaultSetChatBackground
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputBackground as InputBackground
import qualified TD.Data.BackgroundType as BackgroundType

-- | Sets the background in a specific chat. Supported only in private and secret chats with non-deleted users, and in chats with sufficient boost level and can_change_info administrator right. Returns 'TD.Data.Ok.Ok'
data SetChatBackground
  = SetChatBackground
    { chat_id            :: Maybe Int                             -- ^ Chat identifier
    , background         :: Maybe InputBackground.InputBackground -- ^ The input background to use; pass null to create a new filled or chat theme background
    , _type              :: Maybe BackgroundType.BackgroundType   -- ^ Background type; pass null to use default background type for the chosen background; backgroundTypeChatTheme isn't supported for private and secret chats. Use chatBoostLevelFeatures.chat_theme_background_count and chatBoostLevelFeatures.can_set_custom_background to check whether the background type can be set in the boosted chat
    , dark_theme_dimming :: Maybe Int                             -- ^ Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background
    , only_for_self      :: Maybe Bool                            -- ^ Pass true to set background only for self; pass false to set background for all chat users. Always false for backgrounds set in boosted chats. Background can be set for both users only by Telegram Premium users and if set background isn't of the type inputBackgroundPrevious
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatBackground where
  shortShow
    SetChatBackground
      { chat_id            = chat_id_
      , background         = background_
      , _type              = _type_
      , dark_theme_dimming = dark_theme_dimming_
      , only_for_self      = only_for_self_
      }
        = "SetChatBackground"
          ++ I.cc
          [ "chat_id"            `I.p` chat_id_
          , "background"         `I.p` background_
          , "_type"              `I.p` _type_
          , "dark_theme_dimming" `I.p` dark_theme_dimming_
          , "only_for_self"      `I.p` only_for_self_
          ]

instance AT.ToJSON SetChatBackground where
  toJSON
    SetChatBackground
      { chat_id            = chat_id_
      , background         = background_
      , _type              = _type_
      , dark_theme_dimming = dark_theme_dimming_
      , only_for_self      = only_for_self_
      }
        = A.object
          [ "@type"              A..= AT.String "setChatBackground"
          , "chat_id"            A..= chat_id_
          , "background"         A..= background_
          , "type"               A..= _type_
          , "dark_theme_dimming" A..= dark_theme_dimming_
          , "only_for_self"      A..= only_for_self_
          ]

defaultSetChatBackground :: SetChatBackground
defaultSetChatBackground =
  SetChatBackground
    { chat_id            = Nothing
    , background         = Nothing
    , _type              = Nothing
    , dark_theme_dimming = Nothing
    , only_for_self      = Nothing
    }

