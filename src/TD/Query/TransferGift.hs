module TD.Query.TransferGift
  (TransferGift(..)
  , defaultTransferGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Sends a gift upgraded by the current user to another user. Returns 'TD.Data.Ok.Ok'
data TransferGift
  = TransferGift
    { sender_user_id   :: Maybe Int -- ^ Identifier of the user that sent the gift
    , message_id       :: Maybe Int -- ^ Identifier of the message with the upgraded gift in the chat with the user
    , receiver_user_id :: Maybe Int -- ^ Identifier of the user that will receive the gift
    , star_count       :: Maybe Int -- ^ The amount of Telegram Stars required for the transfer
    }
  deriving (Eq, Show)

instance I.ShortShow TransferGift where
  shortShow
    TransferGift
      { sender_user_id   = sender_user_id_
      , message_id       = message_id_
      , receiver_user_id = receiver_user_id_
      , star_count       = star_count_
      }
        = "TransferGift"
          ++ I.cc
          [ "sender_user_id"   `I.p` sender_user_id_
          , "message_id"       `I.p` message_id_
          , "receiver_user_id" `I.p` receiver_user_id_
          , "star_count"       `I.p` star_count_
          ]

instance AT.ToJSON TransferGift where
  toJSON
    TransferGift
      { sender_user_id   = sender_user_id_
      , message_id       = message_id_
      , receiver_user_id = receiver_user_id_
      , star_count       = star_count_
      }
        = A.object
          [ "@type"            A..= AT.String "transferGift"
          , "sender_user_id"   A..= sender_user_id_
          , "message_id"       A..= message_id_
          , "receiver_user_id" A..= receiver_user_id_
          , "star_count"       A..= star_count_
          ]

defaultTransferGift :: TransferGift
defaultTransferGift =
  TransferGift
    { sender_user_id   = Nothing
    , message_id       = Nothing
    , receiver_user_id = Nothing
    , star_count       = Nothing
    }

