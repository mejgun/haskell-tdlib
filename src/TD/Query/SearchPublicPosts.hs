module TD.Query.SearchPublicPosts
  (SearchPublicPosts(..)
  , defaultSearchPublicPosts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for public channel posts using the given query. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit. Returns 'TD.Data.FoundPublicPosts.FoundPublicPosts'
data SearchPublicPosts
  = SearchPublicPosts
    { query      :: Maybe T.Text -- ^ Query to search for
    , offset     :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit      :: Maybe Int    -- ^ The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    , star_count :: Maybe Int    -- ^ The amount of Telegram Stars the user agreed to pay for the search; pass 0 for free searches
    }
  deriving (Eq, Show)

instance I.ShortShow SearchPublicPosts where
  shortShow
    SearchPublicPosts
      { query      = query_
      , offset     = offset_
      , limit      = limit_
      , star_count = star_count_
      }
        = "SearchPublicPosts"
          ++ I.cc
          [ "query"      `I.p` query_
          , "offset"     `I.p` offset_
          , "limit"      `I.p` limit_
          , "star_count" `I.p` star_count_
          ]

instance AT.ToJSON SearchPublicPosts where
  toJSON
    SearchPublicPosts
      { query      = query_
      , offset     = offset_
      , limit      = limit_
      , star_count = star_count_
      }
        = A.object
          [ "@type"      A..= AT.String "searchPublicPosts"
          , "query"      A..= query_
          , "offset"     A..= offset_
          , "limit"      A..= limit_
          , "star_count" A..= star_count_
          ]

defaultSearchPublicPosts :: SearchPublicPosts
defaultSearchPublicPosts =
  SearchPublicPosts
    { query      = Nothing
    , offset     = Nothing
    , limit      = Nothing
    , star_count = Nothing
    }

