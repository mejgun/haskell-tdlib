module TD.Query.TransferGift
  (TransferGift(..)
  , defaultTransferGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.MessageSender as MessageSender

-- | Sends an upgraded gift to another user or a channel chat. Returns 'TD.Data.Ok.Ok'
data TransferGift
  = TransferGift
    { business_connection_id :: Maybe T.Text                      -- ^ Unique identifier of business connection on behalf of which to send the request; for bots only
    , received_gift_id       :: Maybe T.Text                      -- ^ Identifier of the gift
    , new_owner_id           :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that will receive the gift
    , star_count             :: Maybe Int                         -- ^ The amount of Telegram Stars required to pay for the transfer
    }
  deriving (Eq, Show)

instance I.ShortShow TransferGift where
  shortShow
    TransferGift
      { business_connection_id = business_connection_id_
      , received_gift_id       = received_gift_id_
      , new_owner_id           = new_owner_id_
      , star_count             = star_count_
      }
        = "TransferGift"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "received_gift_id"       `I.p` received_gift_id_
          , "new_owner_id"           `I.p` new_owner_id_
          , "star_count"             `I.p` star_count_
          ]

instance AT.ToJSON TransferGift where
  toJSON
    TransferGift
      { business_connection_id = business_connection_id_
      , received_gift_id       = received_gift_id_
      , new_owner_id           = new_owner_id_
      , star_count             = star_count_
      }
        = A.object
          [ "@type"                  A..= AT.String "transferGift"
          , "business_connection_id" A..= business_connection_id_
          , "received_gift_id"       A..= received_gift_id_
          , "new_owner_id"           A..= new_owner_id_
          , "star_count"             A..= star_count_
          ]

defaultTransferGift :: TransferGift
defaultTransferGift =
  TransferGift
    { business_connection_id = Nothing
    , received_gift_id       = Nothing
    , new_owner_id           = Nothing
    , star_count             = Nothing
    }

