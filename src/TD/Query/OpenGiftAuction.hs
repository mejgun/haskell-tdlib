module TD.Query.OpenGiftAuction
  (OpenGiftAuction(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that a gift auction was opened by the user. Returns 'TD.Data.Ok.Ok'
data OpenGiftAuction
  = OpenGiftAuction
    { gift_id :: Maybe Int -- ^ Identifier of the gift, which auction was opened
    }
  deriving (Eq, Show)

instance I.ShortShow OpenGiftAuction where
  shortShow
    OpenGiftAuction
      { gift_id = gift_id_
      }
        = "OpenGiftAuction"
          ++ I.cc
          [ "gift_id" `I.p` gift_id_
          ]

instance AT.ToJSON OpenGiftAuction where
  toJSON
    OpenGiftAuction
      { gift_id = gift_id_
      }
        = A.object
          [ "@type"   A..= AT.String "openGiftAuction"
          , "gift_id" A..= fmap I.writeInt64  gift_id_
          ]

