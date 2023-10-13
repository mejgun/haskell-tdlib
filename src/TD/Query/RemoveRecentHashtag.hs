module TD.Query.RemoveRecentHashtag
  (RemoveRecentHashtag(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data RemoveRecentHashtag -- ^ Removes a hashtag from the list of recently used hashtags
  = RemoveRecentHashtag
    { hashtag :: Maybe T.Text -- ^ Hashtag to delete
    }
  deriving (Eq)

instance Show RemoveRecentHashtag where
  show
    RemoveRecentHashtag
      { hashtag = hashtag_
      }
        = "RemoveRecentHashtag"
          ++ I.cc
          [ "hashtag" `I.p` hashtag_
          ]

instance AT.ToJSON RemoveRecentHashtag where
  toJSON
    RemoveRecentHashtag
      { hashtag = hashtag_
      }
        = A.object
          [ "@type"   A..= AT.String "removeRecentHashtag"
          , "hashtag" A..= hashtag_
          ]

