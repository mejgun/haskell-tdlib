module TD.Query.SendGift
  (SendGift(..)
  , defaultSendGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.FormattedText as FormattedText

-- | Sends a gift to another user or channel chat. May return an error with a message "STARGIFT_USAGE_LIMITED" if the gift was sold out. Returns 'TD.Data.Ok.Ok'
data SendGift
  = SendGift
    { gift_id         :: Maybe Int                         -- ^ Identifier of the gift to send
    , owner_id        :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that will receive the gift
    , text            :: Maybe FormattedText.FormattedText -- ^ Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities are allowed
    , is_private      :: Maybe Bool                        -- ^ Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them
    , pay_for_upgrade :: Maybe Bool                        -- ^ Pass true to additionally pay for the gift upgrade and allow the receiver to upgrade it for free
    }
  deriving (Eq, Show)

instance I.ShortShow SendGift where
  shortShow
    SendGift
      { gift_id         = gift_id_
      , owner_id        = owner_id_
      , text            = text_
      , is_private      = is_private_
      , pay_for_upgrade = pay_for_upgrade_
      }
        = "SendGift"
          ++ I.cc
          [ "gift_id"         `I.p` gift_id_
          , "owner_id"        `I.p` owner_id_
          , "text"            `I.p` text_
          , "is_private"      `I.p` is_private_
          , "pay_for_upgrade" `I.p` pay_for_upgrade_
          ]

instance AT.ToJSON SendGift where
  toJSON
    SendGift
      { gift_id         = gift_id_
      , owner_id        = owner_id_
      , text            = text_
      , is_private      = is_private_
      , pay_for_upgrade = pay_for_upgrade_
      }
        = A.object
          [ "@type"           A..= AT.String "sendGift"
          , "gift_id"         A..= fmap I.writeInt64  gift_id_
          , "owner_id"        A..= owner_id_
          , "text"            A..= text_
          , "is_private"      A..= is_private_
          , "pay_for_upgrade" A..= pay_for_upgrade_
          ]

defaultSendGift :: SendGift
defaultSendGift =
  SendGift
    { gift_id         = Nothing
    , owner_id        = Nothing
    , text            = Nothing
    , is_private      = Nothing
    , pay_for_upgrade = Nothing
    }

