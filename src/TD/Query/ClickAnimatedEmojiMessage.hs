module TD.Query.ClickAnimatedEmojiMessage
  (ClickAnimatedEmojiMessage(..)
  , defaultClickAnimatedEmojiMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that a message with an animated emoji was clicked by the user. Returns a big animated sticker to be played or a 404 error if usual animation needs to be played. Returns 'TD.Data.Sticker.Sticker'
data ClickAnimatedEmojiMessage
  = ClickAnimatedEmojiMessage
    { chat_id    :: Maybe Int -- ^ Chat identifier of the message
    , message_id :: Maybe Int -- ^ Identifier of the clicked message
    }
  deriving (Eq, Show)

instance I.ShortShow ClickAnimatedEmojiMessage where
  shortShow
    ClickAnimatedEmojiMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "ClickAnimatedEmojiMessage"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON ClickAnimatedEmojiMessage where
  toJSON
    ClickAnimatedEmojiMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "clickAnimatedEmojiMessage"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultClickAnimatedEmojiMessage :: ClickAnimatedEmojiMessage
defaultClickAnimatedEmojiMessage =
  ClickAnimatedEmojiMessage
    { chat_id    = Nothing
    , message_id = Nothing
    }

