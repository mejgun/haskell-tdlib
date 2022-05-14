{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StickerSetInfo as StickerSetInfo
import qualified Utils as U

-- |
data StickerSets = -- | Represents a list of sticker sets @total_count Approximate total number of sticker sets found @sets List of sticker sets
  StickerSets
  { -- |
    sets :: Maybe [StickerSetInfo.StickerSetInfo],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show StickerSets where
  show
    StickerSets
      { sets = sets_,
        total_count = total_count_
      } =
      "StickerSets"
        ++ U.cc
          [ U.p "sets" sets_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON StickerSets where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "stickerSets" -> parseStickerSets v
      _ -> mempty
    where
      parseStickerSets :: A.Value -> T.Parser StickerSets
      parseStickerSets = A.withObject "StickerSets" $ \o -> do
        sets_ <- o A..:? "sets"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ StickerSets {sets = sets_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON StickerSets where
  toJSON
    StickerSets
      { sets = sets_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "stickerSets",
          "sets" A..= sets_,
          "total_count" A..= total_count_
        ]
