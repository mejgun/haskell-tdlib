module TD.Query.SearchCallMessages
  (SearchCallMessages(..)
  , defaultSearchCallMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for call messages. Returns the results in reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib. Returns 'TD.Data.FoundMessages.FoundMessages'
data SearchCallMessages
  = SearchCallMessages
    { offset      :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit       :: Maybe Int    -- ^ The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    , only_missed :: Maybe Bool   -- ^ Pass true to search only for messages with missed/declined calls
    }
  deriving (Eq, Show)

instance I.ShortShow SearchCallMessages where
  shortShow
    SearchCallMessages
      { offset      = offset_
      , limit       = limit_
      , only_missed = only_missed_
      }
        = "SearchCallMessages"
          ++ I.cc
          [ "offset"      `I.p` offset_
          , "limit"       `I.p` limit_
          , "only_missed" `I.p` only_missed_
          ]

instance AT.ToJSON SearchCallMessages where
  toJSON
    SearchCallMessages
      { offset      = offset_
      , limit       = limit_
      , only_missed = only_missed_
      }
        = A.object
          [ "@type"       A..= AT.String "searchCallMessages"
          , "offset"      A..= offset_
          , "limit"       A..= limit_
          , "only_missed" A..= only_missed_
          ]

defaultSearchCallMessages :: SearchCallMessages
defaultSearchCallMessages =
  SearchCallMessages
    { offset      = Nothing
    , limit       = Nothing
    , only_missed = Nothing
    }

