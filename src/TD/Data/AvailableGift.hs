module TD.Data.AvailableGift
  (AvailableGift(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Gift as Gift
import qualified Data.Text as T

data AvailableGift
  = AvailableGift -- ^ Describes a gift that is available for purchase
    { gift                  :: Maybe Gift.Gift -- ^ The gift
    , resale_count          :: Maybe Int       -- ^ Number of gifts that are available for resale
    , min_resale_star_count :: Maybe Int       -- ^ The minimum price for the gifts available for resale; 0 if there are no such gifts
    , title                 :: Maybe T.Text    -- ^ The title of the upgraded gift; empty if the gift isn't available for resale
    }
  deriving (Eq, Show)

instance I.ShortShow AvailableGift where
  shortShow AvailableGift
    { gift                  = gift_
    , resale_count          = resale_count_
    , min_resale_star_count = min_resale_star_count_
    , title                 = title_
    }
      = "AvailableGift"
        ++ I.cc
        [ "gift"                  `I.p` gift_
        , "resale_count"          `I.p` resale_count_
        , "min_resale_star_count" `I.p` min_resale_star_count_
        , "title"                 `I.p` title_
        ]

instance AT.FromJSON AvailableGift where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "availableGift" -> parseAvailableGift v
      _               -> mempty
    
    where
      parseAvailableGift :: A.Value -> AT.Parser AvailableGift
      parseAvailableGift = A.withObject "AvailableGift" $ \o -> do
        gift_                  <- o A..:?  "gift"
        resale_count_          <- o A..:?  "resale_count"
        min_resale_star_count_ <- o A..:?  "min_resale_star_count"
        title_                 <- o A..:?  "title"
        pure $ AvailableGift
          { gift                  = gift_
          , resale_count          = resale_count_
          , min_resale_star_count = min_resale_star_count_
          , title                 = title_
          }
  parseJSON _ = mempty

