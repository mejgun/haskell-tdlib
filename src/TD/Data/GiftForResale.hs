module TD.Data.GiftForResale
  (GiftForResale(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UpgradedGift as UpgradedGift
import qualified Data.Text as T

data GiftForResale
  = GiftForResale -- ^ Describes a gift available for resale
    { gift             :: Maybe UpgradedGift.UpgradedGift -- ^ The gift
    , received_gift_id :: Maybe T.Text                    -- ^ Unique identifier of the received gift for the current user; only for the gifts owned by the current user
    }
  deriving (Eq, Show)

instance I.ShortShow GiftForResale where
  shortShow GiftForResale
    { gift             = gift_
    , received_gift_id = received_gift_id_
    }
      = "GiftForResale"
        ++ I.cc
        [ "gift"             `I.p` gift_
        , "received_gift_id" `I.p` received_gift_id_
        ]

instance AT.FromJSON GiftForResale where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftForResale" -> parseGiftForResale v
      _               -> mempty
    
    where
      parseGiftForResale :: A.Value -> AT.Parser GiftForResale
      parseGiftForResale = A.withObject "GiftForResale" $ \o -> do
        gift_             <- o A..:?  "gift"
        received_gift_id_ <- o A..:?  "received_gift_id"
        pure $ GiftForResale
          { gift             = gift_
          , received_gift_id = received_gift_id_
          }
  parseJSON _ = mempty

