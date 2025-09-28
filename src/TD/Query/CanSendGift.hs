module TD.Query.CanSendGift
  (CanSendGift(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Checks whether a gift with next_send_date in the future can be sent already. Returns 'TD.Data.CanSendGiftResult.CanSendGiftResult'
data CanSendGift
  = CanSendGift
    { gift_id :: Maybe Int -- ^ Identifier of the gift to send
    }
  deriving (Eq, Show)

instance I.ShortShow CanSendGift where
  shortShow
    CanSendGift
      { gift_id = gift_id_
      }
        = "CanSendGift"
          ++ I.cc
          [ "gift_id" `I.p` gift_id_
          ]

instance AT.ToJSON CanSendGift where
  toJSON
    CanSendGift
      { gift_id = gift_id_
      }
        = A.object
          [ "@type"   A..= AT.String "canSendGift"
          , "gift_id" A..= fmap I.writeInt64  gift_id_
          ]

