module TD.Query.BuyGiftUpgrade
  (BuyGiftUpgrade(..)
  , defaultBuyGiftUpgrade
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Pays for upgrade of a regular gift that is owned by another user or channel chat. Returns 'TD.Data.Ok.Ok'
data BuyGiftUpgrade
  = BuyGiftUpgrade
    { owner_id             :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that owns the gift
    , prepaid_upgrade_hash :: Maybe T.Text                      -- ^ Prepaid upgrade hash as received along with the gift
    , star_count           :: Maybe Int                         -- ^ The amount of Telegram Stars the user agreed to pay for the upgrade; must be equal to gift.upgrade_star_count
    }
  deriving (Eq, Show)

instance I.ShortShow BuyGiftUpgrade where
  shortShow
    BuyGiftUpgrade
      { owner_id             = owner_id_
      , prepaid_upgrade_hash = prepaid_upgrade_hash_
      , star_count           = star_count_
      }
        = "BuyGiftUpgrade"
          ++ I.cc
          [ "owner_id"             `I.p` owner_id_
          , "prepaid_upgrade_hash" `I.p` prepaid_upgrade_hash_
          , "star_count"           `I.p` star_count_
          ]

instance AT.ToJSON BuyGiftUpgrade where
  toJSON
    BuyGiftUpgrade
      { owner_id             = owner_id_
      , prepaid_upgrade_hash = prepaid_upgrade_hash_
      , star_count           = star_count_
      }
        = A.object
          [ "@type"                A..= AT.String "buyGiftUpgrade"
          , "owner_id"             A..= owner_id_
          , "prepaid_upgrade_hash" A..= prepaid_upgrade_hash_
          , "star_count"           A..= star_count_
          ]

defaultBuyGiftUpgrade :: BuyGiftUpgrade
defaultBuyGiftUpgrade =
  BuyGiftUpgrade
    { owner_id             = Nothing
    , prepaid_upgrade_hash = Nothing
    , star_count           = Nothing
    }

