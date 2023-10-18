module TD.Query.GetTrendingStickerSets
  (GetTrendingStickerSets(..)
  , defaultGetTrendingStickerSets
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerType as StickerType

-- | Returns a list of trending sticker sets. For optimal performance, the number of returned sticker sets is chosen by TDLib. Returns 'TD.Data.TrendingStickerSets.TrendingStickerSets'
data GetTrendingStickerSets
  = GetTrendingStickerSets
    { sticker_type :: Maybe StickerType.StickerType -- ^ Type of the sticker sets to return
    , offset       :: Maybe Int                     -- ^ The offset from which to return the sticker sets; must be non-negative
    , limit        :: Maybe Int                     -- ^ The maximum number of sticker sets to be returned; up to 100. For optimal performance, the number of returned sticker sets is chosen by TDLib and can be smaller than the specified limit, even if the end of the list has not been reached
    }
  deriving (Eq, Show)

instance I.ShortShow GetTrendingStickerSets where
  shortShow
    GetTrendingStickerSets
      { sticker_type = sticker_type_
      , offset       = offset_
      , limit        = limit_
      }
        = "GetTrendingStickerSets"
          ++ I.cc
          [ "sticker_type" `I.p` sticker_type_
          , "offset"       `I.p` offset_
          , "limit"        `I.p` limit_
          ]

instance AT.ToJSON GetTrendingStickerSets where
  toJSON
    GetTrendingStickerSets
      { sticker_type = sticker_type_
      , offset       = offset_
      , limit        = limit_
      }
        = A.object
          [ "@type"        A..= AT.String "getTrendingStickerSets"
          , "sticker_type" A..= sticker_type_
          , "offset"       A..= offset_
          , "limit"        A..= limit_
          ]

defaultGetTrendingStickerSets :: GetTrendingStickerSets
defaultGetTrendingStickerSets =
  GetTrendingStickerSets
    { sticker_type = Nothing
    , offset       = Nothing
    , limit        = Nothing
    }

