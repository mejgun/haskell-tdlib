{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TrendingStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerSetInfo as StickerSetInfo
import qualified Utils as U

-- |
data TrendingStickerSets = -- | Represents a list of trending sticker sets @total_count Approximate total number of trending sticker sets @sets List of trending sticker sets @is_premium True, if the list contains sticker sets with premium stickers
  TrendingStickerSets
  { -- |
    is_premium :: Maybe Bool,
    -- |
    sets :: Maybe [StickerSetInfo.StickerSetInfo],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show TrendingStickerSets where
  show
    TrendingStickerSets
      { is_premium = is_premium_,
        sets = sets_,
        total_count = total_count_
      } =
      "TrendingStickerSets"
        ++ U.cc
          [ U.p "is_premium" is_premium_,
            U.p "sets" sets_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON TrendingStickerSets where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "trendingStickerSets" -> parseTrendingStickerSets v
      _ -> mempty
    where
      parseTrendingStickerSets :: A.Value -> T.Parser TrendingStickerSets
      parseTrendingStickerSets = A.withObject "TrendingStickerSets" $ \o -> do
        is_premium_ <- o A..:? "is_premium"
        sets_ <- o A..:? "sets"
        total_count_ <- o A..:? "total_count"
        return $ TrendingStickerSets {is_premium = is_premium_, sets = sets_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON TrendingStickerSets where
  toJSON
    TrendingStickerSets
      { is_premium = is_premium_,
        sets = sets_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "trendingStickerSets",
          "is_premium" A..= is_premium_,
          "sets" A..= sets_,
          "total_count" A..= total_count_
        ]
