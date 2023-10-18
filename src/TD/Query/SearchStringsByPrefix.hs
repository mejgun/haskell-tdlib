module TD.Query.SearchStringsByPrefix
  (SearchStringsByPrefix(..)
  , defaultSearchStringsByPrefix
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches specified query by word prefixes in the provided strings. Returns 0-based positions of strings that matched. Can be called synchronously. Returns 'TD.Data.FoundPositions.FoundPositions'
data SearchStringsByPrefix
  = SearchStringsByPrefix
    { strings                     :: Maybe [T.Text] -- ^ The strings to search in for the query
    , query                       :: Maybe T.Text   -- ^ Query to search for
    , limit                       :: Maybe Int      -- ^ The maximum number of objects to return
    , return_none_for_empty_query :: Maybe Bool     -- ^ Pass true to receive no results for an empty query
    }
  deriving (Eq, Show)

instance I.ShortShow SearchStringsByPrefix where
  shortShow
    SearchStringsByPrefix
      { strings                     = strings_
      , query                       = query_
      , limit                       = limit_
      , return_none_for_empty_query = return_none_for_empty_query_
      }
        = "SearchStringsByPrefix"
          ++ I.cc
          [ "strings"                     `I.p` strings_
          , "query"                       `I.p` query_
          , "limit"                       `I.p` limit_
          , "return_none_for_empty_query" `I.p` return_none_for_empty_query_
          ]

instance AT.ToJSON SearchStringsByPrefix where
  toJSON
    SearchStringsByPrefix
      { strings                     = strings_
      , query                       = query_
      , limit                       = limit_
      , return_none_for_empty_query = return_none_for_empty_query_
      }
        = A.object
          [ "@type"                       A..= AT.String "searchStringsByPrefix"
          , "strings"                     A..= strings_
          , "query"                       A..= query_
          , "limit"                       A..= limit_
          , "return_none_for_empty_query" A..= return_none_for_empty_query_
          ]

defaultSearchStringsByPrefix :: SearchStringsByPrefix
defaultSearchStringsByPrefix =
  SearchStringsByPrefix
    { strings                     = Nothing
    , query                       = Nothing
    , limit                       = Nothing
    , return_none_for_empty_query = Nothing
    }

