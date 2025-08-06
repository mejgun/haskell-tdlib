module TD.Query.SellGift
  (SellGift(..)
  , defaultSellGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sells a gift for Telegram Stars; requires owner privileges for gifts owned by a chat. Returns 'TD.Data.Ok.Ok'
data SellGift
  = SellGift
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection on behalf of which to send the request; for bots only
    , received_gift_id       :: Maybe T.Text -- ^ Identifier of the gift
    }
  deriving (Eq, Show)

instance I.ShortShow SellGift where
  shortShow
    SellGift
      { business_connection_id = business_connection_id_
      , received_gift_id       = received_gift_id_
      }
        = "SellGift"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "received_gift_id"       `I.p` received_gift_id_
          ]

instance AT.ToJSON SellGift where
  toJSON
    SellGift
      { business_connection_id = business_connection_id_
      , received_gift_id       = received_gift_id_
      }
        = A.object
          [ "@type"                  A..= AT.String "sellGift"
          , "business_connection_id" A..= business_connection_id_
          , "received_gift_id"       A..= received_gift_id_
          ]

defaultSellGift :: SellGift
defaultSellGift =
  SellGift
    { business_connection_id = Nothing
    , received_gift_id       = Nothing
    }

