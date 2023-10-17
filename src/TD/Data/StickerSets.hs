module TD.Data.StickerSets
  (StickerSets(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerSetInfo as StickerSetInfo

data StickerSets
  = StickerSets -- ^ Represents a list of sticker sets
    { total_count :: Maybe Int                             -- ^ Approximate total number of sticker sets found
    , sets        :: Maybe [StickerSetInfo.StickerSetInfo] -- ^ List of sticker sets
    }
  deriving (Eq, Show)

instance I.ShortShow StickerSets where
  shortShow StickerSets
    { total_count = total_count_
    , sets        = sets_
    }
      = "StickerSets"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "sets"        `I.p` sets_
        ]

instance AT.FromJSON StickerSets where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "stickerSets" -> parseStickerSets v
      _             -> mempty
    
    where
      parseStickerSets :: A.Value -> AT.Parser StickerSets
      parseStickerSets = A.withObject "StickerSets" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        sets_        <- o A..:?  "sets"
        pure $ StickerSets
          { total_count = total_count_
          , sets        = sets_
          }
  parseJSON _ = mempty

