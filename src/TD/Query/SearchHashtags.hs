module TD.Query.SearchHashtags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SearchHashtags -- ^ Searches for recently used hashtags by their prefix
  = SearchHashtags
    { prefix :: Maybe T.Text -- ^ Hashtag prefix to search for
    , limit  :: Maybe Int    -- ^ The maximum number of hashtags to be returned
    }
  deriving (Eq)

instance Show SearchHashtags where
  show
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
