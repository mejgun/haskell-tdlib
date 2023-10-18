module TD.Query.SearchHashtags
  (SearchHashtags(..)
  , defaultSearchHashtags
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for recently used hashtags by their prefix. Returns 'TD.Data.Hashtags.Hashtags'
data SearchHashtags
  = SearchHashtags
    { prefix :: Maybe T.Text -- ^ Hashtag prefix to search for
    , limit  :: Maybe Int    -- ^ The maximum number of hashtags to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow SearchHashtags where
  shortShow
    SearchHashtags
      { prefix = prefix_
      , limit  = limit_
      }
        = "SearchHashtags"
          ++ I.cc
          [ "prefix" `I.p` prefix_
          , "limit"  `I.p` limit_
          ]

instance AT.ToJSON SearchHashtags where
  toJSON
    SearchHashtags
      { prefix = prefix_
      , limit  = limit_
      }
        = A.object
          [ "@type"  A..= AT.String "searchHashtags"
          , "prefix" A..= prefix_
          , "limit"  A..= limit_
          ]

defaultSearchHashtags :: SearchHashtags
defaultSearchHashtags =
  SearchHashtags
    { prefix = Nothing
    , limit  = Nothing
    }

