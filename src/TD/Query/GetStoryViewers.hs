module TD.Query.GetStoryViewers
  (GetStoryViewers(..)
  , defaultGetStoryViewers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns viewers of a story. The method can be called only for stories posted on behalf of the current user. Returns 'TD.Data.StoryViewers.StoryViewers'
data GetStoryViewers
  = GetStoryViewers
    { story_id             :: Maybe Int    -- ^ Story identifier
    , query                :: Maybe T.Text -- ^ Query to search for in names and usernames of the viewers; may be empty to get all relevant viewers
    , only_contacts        :: Maybe Bool   -- ^ Pass true to get only contacts; pass false to get all relevant viewers
    , prefer_with_reaction :: Maybe Bool   -- ^ Pass true to get viewers with reaction first; pass false to get viewers sorted just by view_date
    , offset               :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit                :: Maybe Int    -- ^ The maximum number of story viewers to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetStoryViewers where
  shortShow
    GetStoryViewers
      { story_id             = story_id_
      , query                = query_
      , only_contacts        = only_contacts_
      , prefer_with_reaction = prefer_with_reaction_
      , offset               = offset_
      , limit                = limit_
      }
        = "GetStoryViewers"
          ++ I.cc
          [ "story_id"             `I.p` story_id_
          , "query"                `I.p` query_
          , "only_contacts"        `I.p` only_contacts_
          , "prefer_with_reaction" `I.p` prefer_with_reaction_
          , "offset"               `I.p` offset_
          , "limit"                `I.p` limit_
          ]

instance AT.ToJSON GetStoryViewers where
  toJSON
    GetStoryViewers
      { story_id             = story_id_
      , query                = query_
      , only_contacts        = only_contacts_
      , prefer_with_reaction = prefer_with_reaction_
      , offset               = offset_
      , limit                = limit_
      }
        = A.object
          [ "@type"                A..= AT.String "getStoryViewers"
          , "story_id"             A..= story_id_
          , "query"                A..= query_
          , "only_contacts"        A..= only_contacts_
          , "prefer_with_reaction" A..= prefer_with_reaction_
          , "offset"               A..= offset_
          , "limit"                A..= limit_
          ]

defaultGetStoryViewers :: GetStoryViewers
defaultGetStoryViewers =
  GetStoryViewers
    { story_id             = Nothing
    , query                = Nothing
    , only_contacts        = Nothing
    , prefer_with_reaction = Nothing
    , offset               = Nothing
    , limit                = Nothing
    }

