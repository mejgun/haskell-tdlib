module TD.Query.SendResoldGift
  (SendResoldGift(..)
  , defaultSendResoldGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.MessageSender as MessageSender

-- | Sends an upgraded gift that is available for resale to another user or channel chat; gifts already owned by the current user must be transferred using transferGift and can't be passed to the method. Returns 'TD.Data.Ok.Ok'
data SendResoldGift
  = SendResoldGift
    { gift_name  :: Maybe T.Text                      -- ^ Name of the upgraded gift to send
    , owner_id   :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that will receive the gift
    , star_count :: Maybe Int                         -- ^ The amount of Telegram Stars required to pay for the gift
    }
  deriving (Eq, Show)

instance I.ShortShow SendResoldGift where
  shortShow
    SendResoldGift
      { gift_name  = gift_name_
      , owner_id   = owner_id_
      , star_count = star_count_
      }
        = "SendResoldGift"
          ++ I.cc
          [ "gift_name"  `I.p` gift_name_
          , "owner_id"   `I.p` owner_id_
          , "star_count" `I.p` star_count_
          ]

instance AT.ToJSON SendResoldGift where
  toJSON
    SendResoldGift
      { gift_name  = gift_name_
      , owner_id   = owner_id_
      , star_count = star_count_
      }
        = A.object
          [ "@type"      A..= AT.String "sendResoldGift"
          , "gift_name"  A..= gift_name_
          , "owner_id"   A..= owner_id_
          , "star_count" A..= star_count_
          ]

defaultSendResoldGift :: SendResoldGift
defaultSendResoldGift =
  SendResoldGift
    { gift_name  = Nothing
    , owner_id   = Nothing
    , star_count = Nothing
    }

