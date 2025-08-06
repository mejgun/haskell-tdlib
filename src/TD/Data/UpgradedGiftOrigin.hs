module TD.Data.UpgradedGiftOrigin
  (UpgradedGiftOrigin(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes origin from which the upgraded gift was obtained
data UpgradedGiftOrigin
  = UpgradedGiftOriginUpgrade -- ^ The gift was obtained by upgrading of a previously received gift
    { gift_message_id :: Maybe Int -- ^ Identifier of the message with the regular gift that was upgraded; can be 0 or an identifier of a deleted message
    }
  | UpgradedGiftOriginTransfer -- ^ The gift was transferred from another owner
  | UpgradedGiftOriginResale -- ^ The gift was bought from another user
    { star_count :: Maybe Int -- ^ Number of Telegram Stars that were paid by the sender for the gift
    }
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
    { star_count = star_count_
    }
      = "UpgradedGiftOriginResale"
        ++ I.cc
        [ "star_count" `I.p` star_count_
        ]

instance AT.FromJSON UpgradedGiftOrigin where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftOriginUpgrade"  -> parseUpgradedGiftOriginUpgrade v
      "upgradedGiftOriginTransfer" -> pure UpgradedGiftOriginTransfer
      "upgradedGiftOriginResale"   -> parseUpgradedGiftOriginResale v
      _                            -> mempty
    
    where
      parseUpgradedGiftOriginUpgrade :: A.Value -> AT.Parser UpgradedGiftOrigin
      parseUpgradedGiftOriginUpgrade = A.withObject "UpgradedGiftOriginUpgrade" $ \o -> do
        gift_message_id_ <- o A..:?  "gift_message_id"
        pure $ UpgradedGiftOriginUpgrade
          { gift_message_id = gift_message_id_
          }
      parseUpgradedGiftOriginResale :: A.Value -> AT.Parser UpgradedGiftOrigin
      parseUpgradedGiftOriginResale = A.withObject "UpgradedGiftOriginResale" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        pure $ UpgradedGiftOriginResale
          { star_count = star_count_
          }
  parseJSON _ = mempty

