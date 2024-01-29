module TD.Query.GetSavedMessagesTopics
  (GetSavedMessagesTopics(..)
  , defaultGetSavedMessagesTopics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns list of non-pinned Saved Messages topics from the specified offset. Returns 'TD.Data.FoundSavedMessagesTopics.FoundSavedMessagesTopics'
data GetSavedMessagesTopics
  = GetSavedMessagesTopics
    { offset :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit  :: Maybe Int    -- ^ The maximum number of Saved Messages topics to be returned; up to 100
    }
  deriving (Eq, Show)

instance I.ShortShow GetSavedMessagesTopics where
  shortShow
    GetSavedMessagesTopics
      { offset = offset_
      , limit  = limit_
      }
        = "GetSavedMessagesTopics"
          ++ I.cc
          [ "offset" `I.p` offset_
          , "limit"  `I.p` limit_
          ]

instance AT.ToJSON GetSavedMessagesTopics where
  toJSON
    GetSavedMessagesTopics
      { offset = offset_
      , limit  = limit_
      }
        = A.object
          [ "@type"  A..= AT.String "getSavedMessagesTopics"
          , "offset" A..= offset_
          , "limit"  A..= limit_
          ]

defaultGetSavedMessagesTopics :: GetSavedMessagesTopics
defaultGetSavedMessagesTopics =
  GetSavedMessagesTopics
    { offset = Nothing
    , limit  = Nothing
    }

