module TD.Query.SellGift
  (SellGift(..)
  , defaultSellGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Sells a gift received by the current user for Telegram Stars. Returns 'TD.Data.Ok.Ok'
data SellGift
  = SellGift
    { sender_user_id :: Maybe Int -- ^ Identifier of the user that sent the gift
    , message_id     :: Maybe Int -- ^ Identifier of the message with the gift in the chat with the user
    }
  deriving (Eq, Show)

instance I.ShortShow SellGift where
  shortShow
    SellGift
      { sender_user_id = sender_user_id_
      , message_id     = message_id_
      }
        = "SellGift"
          ++ I.cc
          [ "sender_user_id" `I.p` sender_user_id_
          , "message_id"     `I.p` message_id_
          ]

instance AT.ToJSON SellGift where
  toJSON
    SellGift
      { sender_user_id = sender_user_id_
      , message_id     = message_id_
      }
        = A.object
          [ "@type"          A..= AT.String "sellGift"
          , "sender_user_id" A..= sender_user_id_
          , "message_id"     A..= message_id_
          ]

defaultSellGift :: SellGift
defaultSellGift =
  SellGift
    { sender_user_id = Nothing
    , message_id     = Nothing
    }

