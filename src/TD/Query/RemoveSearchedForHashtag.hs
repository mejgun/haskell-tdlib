module TD.Query.RemoveSearchedForHashtag
  (RemoveSearchedForHashtag(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Removes a hashtag or a cashtag from the list of recently searched for hashtags or cashtags. Returns 'TD.Data.Ok.Ok'
data RemoveSearchedForHashtag
  = RemoveSearchedForHashtag
    { hashtag :: Maybe T.Text -- ^ Hashtag or cashtag to delete
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveSearchedForHashtag where
  shortShow
    RemoveSearchedForHashtag
      { hashtag = hashtag_
      }
        = "RemoveSearchedForHashtag"
          ++ I.cc
          [ "hashtag" `I.p` hashtag_
          ]

instance AT.ToJSON RemoveSearchedForHashtag where
  toJSON
    RemoveSearchedForHashtag
      { hashtag = hashtag_
      }
        = A.object
          [ "@type"   A..= AT.String "removeSearchedForHashtag"
          , "hashtag" A..= hashtag_
          ]

