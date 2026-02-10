module TD.Query.GetGiftsForCrafting
  (GetGiftsForCrafting(..)
  , defaultGetGiftsForCrafting
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns upgraded gifts of the current user who can be used to craft another gifts. Returns 'TD.Data.GiftsForCrafting.GiftsForCrafting'
data GetGiftsForCrafting
  = GetGiftsForCrafting
    { regular_gift_id :: Maybe Int    -- ^ Identifier of the regular gift that will be used for crafting
    , offset          :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit           :: Maybe Int    -- ^ The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetGiftsForCrafting where
  shortShow
    GetGiftsForCrafting
      { regular_gift_id = regular_gift_id_
      , offset          = offset_
      , limit           = limit_
      }
        = "GetGiftsForCrafting"
          ++ I.cc
          [ "regular_gift_id" `I.p` regular_gift_id_
          , "offset"          `I.p` offset_
          , "limit"           `I.p` limit_
          ]

instance AT.ToJSON GetGiftsForCrafting where
  toJSON
    GetGiftsForCrafting
      { regular_gift_id = regular_gift_id_
      , offset          = offset_
      , limit           = limit_
      }
        = A.object
          [ "@type"           A..= AT.String "getGiftsForCrafting"
          , "regular_gift_id" A..= fmap I.writeInt64  regular_gift_id_
          , "offset"          A..= offset_
          , "limit"           A..= limit_
          ]

defaultGetGiftsForCrafting :: GetGiftsForCrafting
defaultGetGiftsForCrafting =
  GetGiftsForCrafting
    { regular_gift_id = Nothing
    , offset          = Nothing
    , limit           = Nothing
    }

