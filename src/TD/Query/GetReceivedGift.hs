module TD.Query.GetReceivedGift
  (GetReceivedGift(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a received gift. Returns 'TD.Data.ReceivedGift.ReceivedGift'
data GetReceivedGift
  = GetReceivedGift
    { received_gift_id :: Maybe T.Text -- ^ Identifier of the gift
    }
  deriving (Eq, Show)

instance I.ShortShow GetReceivedGift where
  shortShow
    GetReceivedGift
      { received_gift_id = received_gift_id_
      }
        = "GetReceivedGift"
          ++ I.cc
          [ "received_gift_id" `I.p` received_gift_id_
          ]

instance AT.ToJSON GetReceivedGift where
  toJSON
    GetReceivedGift
      { received_gift_id = received_gift_id_
      }
        = A.object
          [ "@type"            A..= AT.String "getReceivedGift"
          , "received_gift_id" A..= received_gift_id_
          ]

