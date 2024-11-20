module TD.Query.SetUserEmojiStatus
  (SetUserEmojiStatus(..)
  , defaultSetUserEmojiStatus
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiStatus as EmojiStatus

-- | Changes the emoji status of a user; for bots only. Returns 'TD.Data.Ok.Ok'
data SetUserEmojiStatus
  = SetUserEmojiStatus
    { user_id      :: Maybe Int                     -- ^ Identifier of the user
    , emoji_status :: Maybe EmojiStatus.EmojiStatus -- ^ New emoji status; pass null to switch to the default badge
    }
  deriving (Eq, Show)

instance I.ShortShow SetUserEmojiStatus where
  shortShow
    SetUserEmojiStatus
      { user_id      = user_id_
      , emoji_status = emoji_status_
      }
        = "SetUserEmojiStatus"
          ++ I.cc
          [ "user_id"      `I.p` user_id_
          , "emoji_status" `I.p` emoji_status_
          ]

instance AT.ToJSON SetUserEmojiStatus where
  toJSON
    SetUserEmojiStatus
      { user_id      = user_id_
      , emoji_status = emoji_status_
      }
        = A.object
          [ "@type"        A..= AT.String "setUserEmojiStatus"
          , "user_id"      A..= user_id_
          , "emoji_status" A..= emoji_status_
          ]

defaultSetUserEmojiStatus :: SetUserEmojiStatus
defaultSetUserEmojiStatus =
  SetUserEmojiStatus
    { user_id      = Nothing
    , emoji_status = Nothing
    }

