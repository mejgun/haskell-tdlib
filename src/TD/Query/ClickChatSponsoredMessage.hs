module TD.Query.ClickChatSponsoredMessage
  (ClickChatSponsoredMessage(..)
  , defaultClickChatSponsoredMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that the user opened the sponsored chat via the button, the name, the chat photo, a mention in the sponsored message text, or the media in the sponsored message. Returns 'TD.Data.Ok.Ok'
data ClickChatSponsoredMessage
  = ClickChatSponsoredMessage
    { chat_id         :: Maybe Int  -- ^ Chat identifier of the sponsored message
    , message_id      :: Maybe Int  -- ^ Identifier of the sponsored message
    , is_media_click  :: Maybe Bool -- ^ Pass true if the media was clicked in the sponsored message
    , from_fullscreen :: Maybe Bool -- ^ Pass true if the user expanded the video from the sponsored message fullscreen before the click
    }
  deriving (Eq, Show)

instance I.ShortShow ClickChatSponsoredMessage where
  shortShow
    ClickChatSponsoredMessage
      { chat_id         = chat_id_
      , message_id      = message_id_
      , is_media_click  = is_media_click_
      , from_fullscreen = from_fullscreen_
      }
        = "ClickChatSponsoredMessage"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "message_id"      `I.p` message_id_
          , "is_media_click"  `I.p` is_media_click_
          , "from_fullscreen" `I.p` from_fullscreen_
          ]

instance AT.ToJSON ClickChatSponsoredMessage where
  toJSON
    ClickChatSponsoredMessage
      { chat_id         = chat_id_
      , message_id      = message_id_
      , is_media_click  = is_media_click_
      , from_fullscreen = from_fullscreen_
      }
        = A.object
          [ "@type"           A..= AT.String "clickChatSponsoredMessage"
          , "chat_id"         A..= chat_id_
          , "message_id"      A..= message_id_
          , "is_media_click"  A..= is_media_click_
          , "from_fullscreen" A..= from_fullscreen_
          ]

defaultClickChatSponsoredMessage :: ClickChatSponsoredMessage
defaultClickChatSponsoredMessage =
  ClickChatSponsoredMessage
    { chat_id         = Nothing
    , message_id      = Nothing
    , is_media_click  = Nothing
    , from_fullscreen = Nothing
    }

