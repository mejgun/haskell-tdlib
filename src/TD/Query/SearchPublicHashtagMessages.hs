module TD.Query.SearchPublicHashtagMessages
  (SearchPublicHashtagMessages(..)
  , defaultSearchPublicHashtagMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for public channel posts with the given hashtag or cashtag. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit. Returns 'TD.Data.FoundMessages.FoundMessages'
data SearchPublicHashtagMessages
  = SearchPublicHashtagMessages
    { hashtag :: Maybe T.Text -- ^ Hashtag or cashtag to search for
    , offset  :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit   :: Maybe Int    -- ^ The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow SearchPublicHashtagMessages where
  shortShow
    SearchPublicHashtagMessages
      { hashtag = hashtag_
      , offset  = offset_
      , limit   = limit_
      }
        = "SearchPublicHashtagMessages"
          ++ I.cc
          [ "hashtag" `I.p` hashtag_
          , "offset"  `I.p` offset_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON SearchPublicHashtagMessages where
  toJSON
    SearchPublicHashtagMessages
      { hashtag = hashtag_
      , offset  = offset_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "searchPublicHashtagMessages"
          , "hashtag" A..= hashtag_
          , "offset"  A..= offset_
          , "limit"   A..= limit_
          ]

defaultSearchPublicHashtagMessages :: SearchPublicHashtagMessages
defaultSearchPublicHashtagMessages =
  SearchPublicHashtagMessages
    { hashtag = Nothing
    , offset  = Nothing
    , limit   = Nothing
    }

