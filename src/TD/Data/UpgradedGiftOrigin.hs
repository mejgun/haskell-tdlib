module TD.Data.UpgradedGiftOrigin
  (UpgradedGiftOrigin(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GiftResalePrice as GiftResalePrice

-- | Describes origin from which the upgraded gift was obtained
data UpgradedGiftOrigin
  = UpgradedGiftOriginUpgrade -- ^ The gift was obtained by upgrading of a previously received gift
    { gift_message_id :: Maybe Int -- ^ Identifier of the message with the regular gift that was upgraded; can be 0 or an identifier of a deleted message
    }
  | UpgradedGiftOriginTransfer -- ^ The gift was transferred from another owner
  | UpgradedGiftOriginResale -- ^ The gift was bought from another user
    { price :: Maybe GiftResalePrice.GiftResalePrice -- ^ Price paid by the sender for the gift
    }
  | UpgradedGiftOriginPrepaidUpgrade -- ^ The sender or receiver of the message has paid for upgraid of the gift, which has been completed
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftOrigin where
  shortShow UpgradedGiftOriginUpgrade
    { gift_message_id = gift_message_id_
    }
      = "UpgradedGiftOriginUpgrade"
        ++ I.cc
        [ "gift_message_id" `I.p` gift_message_id_
        ]
  shortShow UpgradedGiftOriginTransfer
      = "UpgradedGiftOriginTransfer"
  shortShow UpgradedGiftOriginResale
    { price = price_
    }
      = "UpgradedGiftOriginResale"
        ++ I.cc
        [ "price" `I.p` price_
        ]
  shortShow UpgradedGiftOriginPrepaidUpgrade
      = "UpgradedGiftOriginPrepaidUpgrade"

instance AT.FromJSON UpgradedGiftOrigin where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftOriginUpgrade"        -> parseUpgradedGiftOriginUpgrade v
      "upgradedGiftOriginTransfer"       -> pure UpgradedGiftOriginTransfer
      "upgradedGiftOriginResale"         -> parseUpgradedGiftOriginResale v
      "upgradedGiftOriginPrepaidUpgrade" -> pure UpgradedGiftOriginPrepaidUpgrade
      _                                  -> mempty
    
    where
      parseUpgradedGiftOriginUpgrade :: A.Value -> AT.Parser UpgradedGiftOrigin
      parseUpgradedGiftOriginUpgrade = A.withObject "UpgradedGiftOriginUpgrade" $ \o -> do
        gift_message_id_ <- o A..:?  "gift_message_id"
        pure $ UpgradedGiftOriginUpgrade
          { gift_message_id = gift_message_id_
          }
      parseUpgradedGiftOriginResale :: A.Value -> AT.Parser UpgradedGiftOrigin
      parseUpgradedGiftOriginResale = A.withObject "UpgradedGiftOriginResale" $ \o -> do
        price_ <- o A..:?  "price"
        pure $ UpgradedGiftOriginResale
          { price = price_
          }
  parseJSON _ = mempty

