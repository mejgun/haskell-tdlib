module TD.Data.AffiliateInfo
  (AffiliateInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StarAmount as StarAmount

data AffiliateInfo
  = AffiliateInfo -- ^ Contains information about an affiliate that received commission from a Telegram Star transaction
    { commission_per_mille :: Maybe Int                   -- ^ The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner
    , affiliate_chat_id    :: Maybe Int                   -- ^ Identifier of the chat which received the commission
    , star_amount          :: Maybe StarAmount.StarAmount -- ^ The amount of Telegram Stars that were received by the affiliate; can be negative for refunds
    }
  deriving (Eq, Show)

instance I.ShortShow AffiliateInfo where
  shortShow AffiliateInfo
    { commission_per_mille = commission_per_mille_
    , affiliate_chat_id    = affiliate_chat_id_
    , star_amount          = star_amount_
    }
      = "AffiliateInfo"
        ++ I.cc
        [ "commission_per_mille" `I.p` commission_per_mille_
        , "affiliate_chat_id"    `I.p` affiliate_chat_id_
        , "star_amount"          `I.p` star_amount_
        ]

instance AT.FromJSON AffiliateInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "affiliateInfo" -> parseAffiliateInfo v
      _               -> mempty
    
    where
      parseAffiliateInfo :: A.Value -> AT.Parser AffiliateInfo
      parseAffiliateInfo = A.withObject "AffiliateInfo" $ \o -> do
        commission_per_mille_ <- o A..:?  "commission_per_mille"
        affiliate_chat_id_    <- o A..:?  "affiliate_chat_id"
        star_amount_          <- o A..:?  "star_amount"
        pure $ AffiliateInfo
          { commission_per_mille = commission_per_mille_
          , affiliate_chat_id    = affiliate_chat_id_
          , star_amount          = star_amount_
          }
  parseJSON _ = mempty

