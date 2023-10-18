module TD.Query.GetStory
  (GetStory(..)
  , defaultGetStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a story. Returns 'TD.Data.Story.Story'
data GetStory
  = GetStory
    { story_sender_chat_id :: Maybe Int  -- ^ Identifier of the chat that posted the story
    , story_id             :: Maybe Int  -- ^ Story identifier
    , only_local           :: Maybe Bool -- ^ Pass true to get only locally available information without sending network requests
    }
  deriving (Eq, Show)

instance I.ShortShow GetStory where
  shortShow
    GetStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , only_local           = only_local_
      }
        = "GetStory"
          ++ I.cc
          [ "story_sender_chat_id" `I.p` story_sender_chat_id_
          , "story_id"             `I.p` story_id_
          , "only_local"           `I.p` only_local_
          ]

instance AT.ToJSON GetStory where
  toJSON
    GetStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , only_local           = only_local_
      }
        = A.object
          [ "@type"                A..= AT.String "getStory"
          , "story_sender_chat_id" A..= story_sender_chat_id_
          , "story_id"             A..= story_id_
          , "only_local"           A..= only_local_
          ]

defaultGetStory :: GetStory
defaultGetStory =
  GetStory
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    , only_local           = Nothing
    }

