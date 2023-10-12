module TD.Query.SetEmojiStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiStatus as EmojiStatus

data SetEmojiStatus -- ^ Changes the emoji status of the current user; for Telegram Premium users only
  = SetEmojiStatus
    { emoji_status :: Maybe EmojiStatus.EmojiStatus -- ^ New emoji status; pass null to switch to the default badge
    }
  deriving (Eq)

instance Show SetEmojiStatus where
  show
    SetEmojiStatus
      { emoji_status = emoji_status_
      }
        = "SetEmojiStatus"
          ++ I.cc
          [ "emoji_status" `I.p` emoji_status_
          ]

instance AT.ToJSON SetEmojiStatus where
  toJSON
    SetEmojiStatus
      { emoji_status = emoji_status_
      }
        = A.object
          [ "@type"        A..= AT.String "setEmojiStatus"
          , "emoji_status" A..= emoji_status_
          ]
