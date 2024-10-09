module TD.Query.SendGift
  (SendGift(..)
  , defaultSendGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Sends a gift to another user. May return an error with a message "STARGIFT_USAGE_LIMITED" if the gift was sold out. Returns 'TD.Data.Ok.Ok'
data SendGift
  = SendGift
    { gift_id    :: Maybe Int                         -- ^ Identifier of the gift to send
    , user_id    :: Maybe Int                         -- ^ Identifier of the user that will receive the gift
    , text       :: Maybe FormattedText.FormattedText -- ^ Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities are allowed
    , is_private :: Maybe Bool                        -- ^ Pass true to show the current user as sender and gift text only to the gift receiver; otherwise, everyone will be able to see them
    }
  deriving (Eq, Show)

instance I.ShortShow SendGift where
  shortShow
    SendGift
      { gift_id    = gift_id_
      , user_id    = user_id_
      , text       = text_
      , is_private = is_private_
      }
        = "SendGift"
          ++ I.cc
          [ "gift_id"    `I.p` gift_id_
          , "user_id"    `I.p` user_id_
          , "text"       `I.p` text_
          , "is_private" `I.p` is_private_
          ]

instance AT.ToJSON SendGift where
  toJSON
    SendGift
      { gift_id    = gift_id_
      , user_id    = user_id_
      , text       = text_
      , is_private = is_private_
      }
        = A.object
          [ "@type"      A..= AT.String "sendGift"
          , "gift_id"    A..= fmap I.writeInt64  gift_id_
          , "user_id"    A..= user_id_
          , "text"       A..= text_
          , "is_private" A..= is_private_
          ]

defaultSendGift :: SendGift
defaultSendGift =
  SendGift
    { gift_id    = Nothing
    , user_id    = Nothing
    , text       = Nothing
    , is_private = Nothing
    }

