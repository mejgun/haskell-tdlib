module TD.Data.TrendingStickerSets
  (TrendingStickerSets(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerSetInfo as StickerSetInfo

data TrendingStickerSets
  = TrendingStickerSets -- ^ Represents a list of trending sticker sets
    { total_count :: Maybe Int                             -- ^ Approximate total number of trending sticker sets
    , sets        :: Maybe [StickerSetInfo.StickerSetInfo] -- ^ List of trending sticker sets
    , is_premium  :: Maybe Bool                            -- ^ True, if the list contains sticker sets with premium stickers
    }
  deriving (Eq, Show)

instance I.ShortShow TrendingStickerSets where
  shortShow TrendingStickerSets
    { total_count = total_count_
    , sets        = sets_
    , is_premium  = is_premium_
    }
      = "TrendingStickerSets"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "sets"        `I.p` sets_
        , "is_premium"  `I.p` is_premium_
        ]

instance AT.FromJSON TrendingStickerSets where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "trendingStickerSets" -> parseTrendingStickerSets v
      _                     -> mempty
    
    where
      parseTrendingStickerSets :: A.Value -> AT.Parser TrendingStickerSets
      parseTrendingStickerSets = A.withObject "TrendingStickerSets" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        sets_        <- o A..:?  "sets"
        is_premium_  <- o A..:?  "is_premium"
        pure $ TrendingStickerSets
          { total_count = total_count_
          , sets        = sets_
          , is_premium  = is_premium_
          }
  parseJSON _ = mempty

