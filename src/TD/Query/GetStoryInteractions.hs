module TD.Query.GetStoryInteractions
  (GetStoryInteractions(..)
  , defaultGetStoryInteractions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns interactions with a story. The method can be called only for stories posted on behalf of the current user. Returns 'TD.Data.StoryInteractions.StoryInteractions'
data GetStoryInteractions
  = GetStoryInteractions
    { story_id             :: Maybe Int    -- ^ Story identifier
    , query                :: Maybe T.Text -- ^ Query to search for in names, usernames and titles; may be empty to get all relevant interactions
    , only_contacts        :: Maybe Bool   -- ^ Pass true to get only interactions by contacts; pass false to get all relevant interactions
    , prefer_forwards      :: Maybe Bool   -- ^ Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date
    , prefer_with_reaction :: Maybe Bool   -- ^ Pass true to get interactions with reaction first; pass false to get interactions sorted just by interaction date. Ignored if prefer_forwards == true
    , offset               :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit                :: Maybe Int    -- ^ The maximum number of story interactions to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetStoryInteractions where
  shortShow
    GetStoryInteractions
      { story_id             = story_id_
      , query                = query_
      , only_contacts        = only_contacts_
      , prefer_forwards      = prefer_forwards_
      , prefer_with_reaction = prefer_with_reaction_
      , offset               = offset_
      , limit                = limit_
      }
        = "GetStoryInteractions"
          ++ I.cc
          [ "story_id"             `I.p` story_id_
          , "query"                `I.p` query_
          , "only_contacts"        `I.p` only_contacts_
          , "prefer_forwards"      `I.p` prefer_forwards_
          , "prefer_with_reaction" `I.p` prefer_with_reaction_
          , "offset"               `I.p` offset_
          , "limit"                `I.p` limit_
          ]

instance AT.ToJSON GetStoryInteractions where
  toJSON
    GetStoryInteractions
      { story_id             = story_id_
      , query                = query_
      , only_contacts        = only_contacts_
      , prefer_forwards      = prefer_forwards_
      , prefer_with_reaction = prefer_with_reaction_
      , offset               = offset_
      , limit                = limit_
      }
        = A.object
          [ "@type"                A..= AT.String "getStoryInteractions"
          , "story_id"             A..= story_id_
          , "query"                A..= query_
          , "only_contacts"        A..= only_contacts_
          , "prefer_forwards"      A..= prefer_forwards_
          , "prefer_with_reaction" A..= prefer_with_reaction_
          , "offset"               A..= offset_
          , "limit"                A..= limit_
          ]

defaultGetStoryInteractions :: GetStoryInteractions
defaultGetStoryInteractions =
  GetStoryInteractions
    { story_id             = Nothing
    , query                = Nothing
    , only_contacts        = Nothing
    , prefer_forwards      = Nothing
    , prefer_with_reaction = Nothing
    , offset               = Nothing
    , limit                = Nothing
    }

