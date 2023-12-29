module TD.Query.SetChatEmojiStatus
  (SetChatEmojiStatus(..)
  , defaultSetChatEmojiStatus
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiStatus as EmojiStatus

-- | Changes the emoji status of a chat. Use chatBoostLevelFeatures.can_set_emoji_status to check whether an emoji status can be set. Requires can_change_info administrator right. Returns 'TD.Data.Ok.Ok'
data SetChatEmojiStatus
  = SetChatEmojiStatus
    { chat_id      :: Maybe Int                     -- ^ Chat identifier
    , emoji_status :: Maybe EmojiStatus.EmojiStatus -- ^ New emoji status; pass null to remove emoji status
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatEmojiStatus where
  shortShow
    SetChatEmojiStatus
      { chat_id      = chat_id_
      , emoji_status = emoji_status_
      }
        = "SetChatEmojiStatus"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "emoji_status" `I.p` emoji_status_
          ]

instance AT.ToJSON SetChatEmojiStatus where
  toJSON
    SetChatEmojiStatus
      { chat_id      = chat_id_
      , emoji_status = emoji_status_
      }
        = A.object
          [ "@type"        A..= AT.String "setChatEmojiStatus"
          , "chat_id"      A..= chat_id_
          , "emoji_status" A..= emoji_status_
          ]

defaultSetChatEmojiStatus :: SetChatEmojiStatus
defaultSetChatEmojiStatus =
  SetChatEmojiStatus
    { chat_id      = Nothing
    , emoji_status = Nothing
    }

