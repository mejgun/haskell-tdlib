module TD.Query.SearchPublicStoriesByVenue
  (SearchPublicStoriesByVenue(..)
  , defaultSearchPublicStoriesByVenue
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for public stories from the given venue. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit. Returns 'TD.Data.FoundStories.FoundStories'
data SearchPublicStoriesByVenue
  = SearchPublicStoriesByVenue
    { venue_provider :: Maybe T.Text -- ^ Provider of the venue
    , venue_id       :: Maybe T.Text -- ^ Identifier of the venue in the provider database
    , offset         :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit          :: Maybe Int    -- ^ The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow SearchPublicStoriesByVenue where
  shortShow
    SearchPublicStoriesByVenue
      { venue_provider = venue_provider_
      , venue_id       = venue_id_
      , offset         = offset_
      , limit          = limit_
      }
        = "SearchPublicStoriesByVenue"
          ++ I.cc
          [ "venue_provider" `I.p` venue_provider_
          , "venue_id"       `I.p` venue_id_
          , "offset"         `I.p` offset_
          , "limit"          `I.p` limit_
          ]

instance AT.ToJSON SearchPublicStoriesByVenue where
  toJSON
    SearchPublicStoriesByVenue
      { venue_provider = venue_provider_
      , venue_id       = venue_id_
      , offset         = offset_
      , limit          = limit_
      }
        = A.object
          [ "@type"          A..= AT.String "searchPublicStoriesByVenue"
          , "venue_provider" A..= venue_provider_
          , "venue_id"       A..= venue_id_
          , "offset"         A..= offset_
          , "limit"          A..= limit_
          ]

defaultSearchPublicStoriesByVenue :: SearchPublicStoriesByVenue
defaultSearchPublicStoriesByVenue =
  SearchPublicStoriesByVenue
    { venue_provider = Nothing
    , venue_id       = Nothing
    , offset         = Nothing
    , limit          = Nothing
    }

