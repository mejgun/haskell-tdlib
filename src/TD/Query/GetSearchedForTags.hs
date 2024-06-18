module TD.Query.GetSearchedForTags
  (GetSearchedForTags(..)
  , defaultGetSearchedForTags
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns recently searched for hashtags or cashtags by their prefix. Returns 'TD.Data.Hashtags.Hashtags'
data GetSearchedForTags
  = GetSearchedForTags
    { tag_prefix :: Maybe T.Text -- ^ Prefix of hashtags or cashtags to return
    , limit      :: Maybe Int    -- ^ The maximum number of items to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow GetSearchedForTags where
  shortShow
    GetSearchedForTags
      { tag_prefix = tag_prefix_
      , limit      = limit_
      }
        = "GetSearchedForTags"
          ++ I.cc
          [ "tag_prefix" `I.p` tag_prefix_
          , "limit"      `I.p` limit_
          ]

instance AT.ToJSON GetSearchedForTags where
  toJSON
    GetSearchedForTags
      { tag_prefix = tag_prefix_
      , limit      = limit_
      }
        = A.object
          [ "@type"      A..= AT.String "getSearchedForTags"
          , "tag_prefix" A..= tag_prefix_
          , "limit"      A..= limit_
          ]

defaultGetSearchedForTags :: GetSearchedForTags
defaultGetSearchedForTags =
  GetSearchedForTags
    { tag_prefix = Nothing
    , limit      = Nothing
    }

