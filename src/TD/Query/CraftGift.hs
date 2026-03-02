module TD.Query.CraftGift
  (CraftGift(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Crafts a new gift from other gifts that will be permanently lost. Returns 'TD.Data.CraftGiftResult.CraftGiftResult'
data CraftGift
  = CraftGift
    { received_gift_ids :: Maybe [T.Text] -- ^ Identifier of the gifts to use for crafting. In the case of a successful craft, the resulting gift will have the number of the first gift. Consequently, the first gift must not have been withdrawn to the TON blockchain as an NFT and must have an empty gift_address
    }
  deriving (Eq, Show)

instance I.ShortShow CraftGift where
  shortShow
    CraftGift
      { received_gift_ids = received_gift_ids_
      }
        = "CraftGift"
          ++ I.cc
          [ "received_gift_ids" `I.p` received_gift_ids_
          ]

instance AT.ToJSON CraftGift where
  toJSON
    CraftGift
      { received_gift_ids = received_gift_ids_
      }
        = A.object
          [ "@type"             A..= AT.String "craftGift"
          , "received_gift_ids" A..= received_gift_ids_
          ]

