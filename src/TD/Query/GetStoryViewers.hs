{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStoryViewers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns viewers of a story. The method can be called only for stories posted on behalf of the current user
data GetStoryViewers = GetStoryViewers
  { -- | The maximum number of story viewers to return
    limit :: Maybe Int,
    -- | Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    offset :: Maybe String,
    -- | Pass true to get viewers with reaction first; pass false to get viewers sorted just by view_date
    prefer_with_reaction :: Maybe Bool,
    -- | Pass true to get only contacts; pass false to get all relevant viewers
    only_contacts :: Maybe Bool,
    -- | Query to search for in names and usernames of the viewers; may be empty to get all relevant viewers
    query :: Maybe String,
    -- | Story identifier
    story_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetStoryViewers where
  show
    GetStoryViewers
      { limit = limit_,
        offset = offset_,
        prefer_with_reaction = prefer_with_reaction_,
        only_contacts = only_contacts_,
        query = query_,
        story_id = story_id_
      } =
      "GetStoryViewers"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset" offset_,
            U.p "prefer_with_reaction" prefer_with_reaction_,
            U.p "only_contacts" only_contacts_,
            U.p "query" query_,
            U.p "story_id" story_id_
          ]

instance T.ToJSON GetStoryViewers where
  toJSON
    GetStoryViewers
      { limit = limit_,
        offset = offset_,
        prefer_with_reaction = prefer_with_reaction_,
        only_contacts = only_contacts_,
        query = query_,
        story_id = story_id_
      } =
      A.object
        [ "@type" A..= T.String "getStoryViewers",
          "limit" A..= limit_,
          "offset" A..= offset_,
          "prefer_with_reaction" A..= prefer_with_reaction_,
          "only_contacts" A..= only_contacts_,
          "query" A..= query_,
          "story_id" A..= story_id_
        ]
