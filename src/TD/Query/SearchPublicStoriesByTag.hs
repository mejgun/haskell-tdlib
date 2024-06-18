module TD.Query.SearchPublicStoriesByTag
  (SearchPublicStoriesByTag(..)
  , defaultSearchPublicStoriesByTag
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for public stories containing the given hashtag or cashtag. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit. Returns 'TD.Data.FoundStories.FoundStories'
data SearchPublicStoriesByTag
  = SearchPublicStoriesByTag
    { tag    :: Maybe T.Text -- ^ Hashtag or cashtag to search for
    , offset :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit  :: Maybe Int    -- ^ The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow SearchPublicStoriesByTag where
  shortShow
    SearchPublicStoriesByTag
      { tag    = tag_
      , offset = offset_
      , limit  = limit_
      }
        = "SearchPublicStoriesByTag"
          ++ I.cc
          [ "tag"    `I.p` tag_
          , "offset" `I.p` offset_
          , "limit"  `I.p` limit_
          ]

instance AT.ToJSON SearchPublicStoriesByTag where
  toJSON
    SearchPublicStoriesByTag
      { tag    = tag_
      , offset = offset_
      , limit  = limit_
      }
        = A.object
          [ "@type"  A..= AT.String "searchPublicStoriesByTag"
          , "tag"    A..= tag_
          , "offset" A..= offset_
          , "limit"  A..= limit_
          ]

defaultSearchPublicStoriesByTag :: SearchPublicStoriesByTag
defaultSearchPublicStoriesByTag =
  SearchPublicStoriesByTag
    { tag    = Nothing
    , offset = Nothing
    , limit  = Nothing
    }

