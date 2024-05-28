module TD.Query.GetSearchedForHashtags
  (GetSearchedForHashtags(..)
  , defaultGetSearchedForHashtags
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns recently searched for hashtags by their prefix. Returns 'TD.Data.Hashtags.Hashtags'
data GetSearchedForHashtags
  = GetSearchedForHashtags
    { prefix :: Maybe T.Text -- ^ Prefix of hashtags to return
    , limit  :: Maybe Int    -- ^ The maximum number of hashtags to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow GetSearchedForHashtags where
  shortShow
    GetSearchedForHashtags
      { prefix = prefix_
      , limit  = limit_
      }
        = "GetSearchedForHashtags"
          ++ I.cc
          [ "prefix" `I.p` prefix_
          , "limit"  `I.p` limit_
          ]

instance AT.ToJSON GetSearchedForHashtags where
  toJSON
    GetSearchedForHashtags
      { prefix = prefix_
      , limit  = limit_
      }
        = A.object
          [ "@type"  A..= AT.String "getSearchedForHashtags"
          , "prefix" A..= prefix_
          , "limit"  A..= limit_
          ]

defaultGetSearchedForHashtags :: GetSearchedForHashtags
defaultGetSearchedForHashtags =
  GetSearchedForHashtags
    { prefix = Nothing
    , limit  = Nothing
    }

