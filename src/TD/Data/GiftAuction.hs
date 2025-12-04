module TD.Data.GiftAuction
  (GiftAuction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GiftAuction
  = GiftAuction -- ^ Describes an auction on which a gift can be purchased
    { _id             :: Maybe T.Text -- ^ Identifier of the auction
    , gifts_per_round :: Maybe Int    -- ^ Number of gifts distributed in each round
    }
  deriving (Eq, Show)

instance I.ShortShow GiftAuction where
  shortShow GiftAuction
    { _id             = _id_
    , gifts_per_round = gifts_per_round_
    }
      = "GiftAuction"
        ++ I.cc
        [ "_id"             `I.p` _id_
        , "gifts_per_round" `I.p` gifts_per_round_
        ]

instance AT.FromJSON GiftAuction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftAuction" -> parseGiftAuction v
      _             -> mempty
    
    where
      parseGiftAuction :: A.Value -> AT.Parser GiftAuction
      parseGiftAuction = A.withObject "GiftAuction" $ \o -> do
        _id_             <- o A..:?  "id"
        gifts_per_round_ <- o A..:?  "gifts_per_round"
        pure $ GiftAuction
          { _id             = _id_
          , gifts_per_round = gifts_per_round_
          }
  parseJSON _ = mempty

