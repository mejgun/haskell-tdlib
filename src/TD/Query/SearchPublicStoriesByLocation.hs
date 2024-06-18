module TD.Query.SearchPublicStoriesByLocation
  (SearchPublicStoriesByLocation(..)
  , defaultSearchPublicStoriesByLocation
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.LocationAddress as LocationAddress
import qualified Data.Text as T

-- | Searches for public stories by the given address location. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit. Returns 'TD.Data.FoundStories.FoundStories'
data SearchPublicStoriesByLocation
  = SearchPublicStoriesByLocation
    { address :: Maybe LocationAddress.LocationAddress -- ^ Address of the location
    , offset  :: Maybe T.Text                          -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit   :: Maybe Int                             -- ^ The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow SearchPublicStoriesByLocation where
  shortShow
    SearchPublicStoriesByLocation
      { address = address_
      , offset  = offset_
      , limit   = limit_
      }
        = "SearchPublicStoriesByLocation"
          ++ I.cc
          [ "address" `I.p` address_
          , "offset"  `I.p` offset_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON SearchPublicStoriesByLocation where
  toJSON
    SearchPublicStoriesByLocation
      { address = address_
      , offset  = offset_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "searchPublicStoriesByLocation"
          , "address" A..= address_
          , "offset"  A..= offset_
          , "limit"   A..= limit_
          ]

defaultSearchPublicStoriesByLocation :: SearchPublicStoriesByLocation
defaultSearchPublicStoriesByLocation =
  SearchPublicStoriesByLocation
    { address = Nothing
    , offset  = Nothing
    , limit   = Nothing
    }

