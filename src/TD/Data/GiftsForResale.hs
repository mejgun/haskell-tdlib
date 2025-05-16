module TD.Data.GiftsForResale
  (GiftsForResale(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GiftForResale as GiftForResale
import qualified TD.Data.UpgradedGiftModelCount as UpgradedGiftModelCount
import qualified TD.Data.UpgradedGiftSymbolCount as UpgradedGiftSymbolCount
import qualified TD.Data.UpgradedGiftBackdropCount as UpgradedGiftBackdropCount
import qualified Data.Text as T

data GiftsForResale
  = GiftsForResale -- ^ Describes gifts available for resale
    { total_count :: Maybe Int                                                   -- ^ Total number of gifts found
    , gifts       :: Maybe [GiftForResale.GiftForResale]                         -- ^ The gifts
    , models      :: Maybe [UpgradedGiftModelCount.UpgradedGiftModelCount]       -- ^ Available models; for searchGiftsForResale requests without offset and attributes only
    , symbols     :: Maybe [UpgradedGiftSymbolCount.UpgradedGiftSymbolCount]     -- ^ Available symbols; for searchGiftsForResale requests without offset and attributes only
    , backdrops   :: Maybe [UpgradedGiftBackdropCount.UpgradedGiftBackdropCount] -- ^ Available backdrops; for searchGiftsForResale requests without offset and attributes only
    , next_offset :: Maybe T.Text                                                -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow GiftsForResale where
  shortShow GiftsForResale
    { total_count = total_count_
    , gifts       = gifts_
    , models      = models_
    , symbols     = symbols_
    , backdrops   = backdrops_
    , next_offset = next_offset_
    }
      = "GiftsForResale"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "gifts"       `I.p` gifts_
        , "models"      `I.p` models_
        , "symbols"     `I.p` symbols_
        , "backdrops"   `I.p` backdrops_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON GiftsForResale where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftsForResale" -> parseGiftsForResale v
      _                -> mempty
    
    where
      parseGiftsForResale :: A.Value -> AT.Parser GiftsForResale
      parseGiftsForResale = A.withObject "GiftsForResale" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        gifts_       <- o A..:?  "gifts"
        models_      <- o A..:?  "models"
        symbols_     <- o A..:?  "symbols"
        backdrops_   <- o A..:?  "backdrops"
        next_offset_ <- o A..:?  "next_offset"
        pure $ GiftsForResale
          { total_count = total_count_
          , gifts       = gifts_
          , models      = models_
          , symbols     = symbols_
          , backdrops   = backdrops_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

