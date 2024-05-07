module TD.Query.ToggleStoryIsPostedToChatPage
  (ToggleStoryIsPostedToChatPage(..)
  , defaultToggleStoryIsPostedToChatPage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether a story is accessible after expiration. Can be called only if story.can_toggle_is_posted_to_chat_page == true. Returns 'TD.Data.Ok.Ok'
data ToggleStoryIsPostedToChatPage
  = ToggleStoryIsPostedToChatPage
    { story_sender_chat_id   :: Maybe Int  -- ^ Identifier of the chat that posted the story
    , story_id               :: Maybe Int  -- ^ Identifier of the story
    , is_posted_to_chat_page :: Maybe Bool -- ^ Pass true to make the story accessible after expiration; pass false to make it private
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleStoryIsPostedToChatPage where
  shortShow
    ToggleStoryIsPostedToChatPage
      { story_sender_chat_id   = story_sender_chat_id_
      , story_id               = story_id_
      , is_posted_to_chat_page = is_posted_to_chat_page_
      }
        = "ToggleStoryIsPostedToChatPage"
          ++ I.cc
          [ "story_sender_chat_id"   `I.p` story_sender_chat_id_
          , "story_id"               `I.p` story_id_
          , "is_posted_to_chat_page" `I.p` is_posted_to_chat_page_
          ]

instance AT.ToJSON ToggleStoryIsPostedToChatPage where
  toJSON
    ToggleStoryIsPostedToChatPage
      { story_sender_chat_id   = story_sender_chat_id_
      , story_id               = story_id_
      , is_posted_to_chat_page = is_posted_to_chat_page_
      }
        = A.object
          [ "@type"                  A..= AT.String "toggleStoryIsPostedToChatPage"
          , "story_sender_chat_id"   A..= story_sender_chat_id_
          , "story_id"               A..= story_id_
          , "is_posted_to_chat_page" A..= is_posted_to_chat_page_
          ]

defaultToggleStoryIsPostedToChatPage :: ToggleStoryIsPostedToChatPage
defaultToggleStoryIsPostedToChatPage =
  ToggleStoryIsPostedToChatPage
    { story_sender_chat_id   = Nothing
    , story_id               = Nothing
    , is_posted_to_chat_page = Nothing
    }

