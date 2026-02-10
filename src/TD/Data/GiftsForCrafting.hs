module TD.Data.GiftsForCrafting
  (GiftsForCrafting(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReceivedGift as ReceivedGift
import qualified TD.Data.AttributeCraftPersistenceProbability as AttributeCraftPersistenceProbability
import qualified Data.Text as T

data GiftsForCrafting
  = GiftsForCrafting -- ^ Represents a list of gifts received by a user or a chat
    { total_count                         :: Maybe Int                                                                         -- ^ The total number of received gifts
    , gifts                               :: Maybe [ReceivedGift.ReceivedGift]                                                 -- ^ The list of gifts
    , attribute_persistence_probabilities :: Maybe [AttributeCraftPersistenceProbability.AttributeCraftPersistenceProbability] -- ^ The 4 objects that describe probabilities of the crafted gift to have the backdrop or symbol of one of the original gifts for the cases when 1, 2, 3 or 4 gifts are used in the craft correspondingly
    , next_offset                         :: Maybe T.Text                                                                      -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow GiftsForCrafting where
  shortShow GiftsForCrafting
    { total_count                         = total_count_
    , gifts                               = gifts_
    , attribute_persistence_probabilities = attribute_persistence_probabilities_
    , next_offset                         = next_offset_
    }
      = "GiftsForCrafting"
        ++ I.cc
        [ "total_count"                         `I.p` total_count_
        , "gifts"                               `I.p` gifts_
        , "attribute_persistence_probabilities" `I.p` attribute_persistence_probabilities_
        , "next_offset"                         `I.p` next_offset_
        ]

instance AT.FromJSON GiftsForCrafting where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftsForCrafting" -> parseGiftsForCrafting v
      _                  -> mempty
    
    where
      parseGiftsForCrafting :: A.Value -> AT.Parser GiftsForCrafting
      parseGiftsForCrafting = A.withObject "GiftsForCrafting" $ \o -> do
        total_count_                         <- o A..:?  "total_count"
        gifts_                               <- o A..:?  "gifts"
        attribute_persistence_probabilities_ <- o A..:?  "attribute_persistence_probabilities"
        next_offset_                         <- o A..:?  "next_offset"
        pure $ GiftsForCrafting
          { total_count                         = total_count_
          , gifts                               = gifts_
          , attribute_persistence_probabilities = attribute_persistence_probabilities_
          , next_offset                         = next_offset_
          }
  parseJSON _ = mempty

