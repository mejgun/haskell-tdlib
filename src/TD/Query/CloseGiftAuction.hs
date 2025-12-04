module TD.Query.CloseGiftAuction
  (CloseGiftAuction(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that a gift auction was closed by the user. Returns 'TD.Data.Ok.Ok'
data CloseGiftAuction
  = CloseGiftAuction
    { gift_id :: Maybe Int -- ^ Identifier of the gift, which auction was closed
    }
  deriving (Eq, Show)

instance I.ShortShow CloseGiftAuction where
  shortShow
    CloseGiftAuction
      { gift_id = gift_id_
      }
        = "CloseGiftAuction"
          ++ I.cc
          [ "gift_id" `I.p` gift_id_
          ]

instance AT.ToJSON CloseGiftAuction where
  toJSON
    CloseGiftAuction
      { gift_id = gift_id_
      }
        = A.object
          [ "@type"   A..= AT.String "closeGiftAuction"
          , "gift_id" A..= fmap I.writeInt64  gift_id_
          ]

