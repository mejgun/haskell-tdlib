module TD.Query.SellGift
  (SellGift(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sells a gift for Telegram Stars. Returns 'TD.Data.Ok.Ok'
data SellGift
  = SellGift
    { received_gift_id :: Maybe T.Text -- ^ Identifier of the gift
    }
  deriving (Eq, Show)

instance I.ShortShow SellGift where
  shortShow
    SellGift
      { received_gift_id = received_gift_id_
      }
        = "SellGift"
          ++ I.cc
          [ "received_gift_id" `I.p` received_gift_id_
          ]

instance AT.ToJSON SellGift where
  toJSON
    SellGift
      { received_gift_id = received_gift_id_
      }
        = A.object
          [ "@type"            A..= AT.String "sellGift"
          , "received_gift_id" A..= received_gift_id_
          ]

