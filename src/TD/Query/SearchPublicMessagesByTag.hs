module TD.Query.SearchPublicMessagesByTag
  (SearchPublicMessagesByTag(..)
  , defaultSearchPublicMessagesByTag
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for public channel posts containing the given hashtag or cashtag. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit. Returns 'TD.Data.FoundMessages.FoundMessages'
data SearchPublicMessagesByTag
  = SearchPublicMessagesByTag
    { tag    :: Maybe T.Text -- ^ Hashtag or cashtag to search for
    , offset :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit  :: Maybe Int    -- ^ The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow SearchPublicMessagesByTag where
  shortShow
    SearchPublicMessagesByTag
      { tag    = tag_
      , offset = offset_
      , limit  = limit_
      }
        = "SearchPublicMessagesByTag"
          ++ I.cc
          [ "tag"    `I.p` tag_
          , "offset" `I.p` offset_
          , "limit"  `I.p` limit_
          ]

instance AT.ToJSON SearchPublicMessagesByTag where
  toJSON
    SearchPublicMessagesByTag
      { tag    = tag_
      , offset = offset_
      , limit  = limit_
      }
        = A.object
          [ "@type"  A..= AT.String "searchPublicMessagesByTag"
          , "tag"    A..= tag_
          , "offset" A..= offset_
          , "limit"  A..= limit_
          ]

defaultSearchPublicMessagesByTag :: SearchPublicMessagesByTag
defaultSearchPublicMessagesByTag =
  SearchPublicMessagesByTag
    { tag    = Nothing
    , offset = Nothing
    , limit  = Nothing
    }

