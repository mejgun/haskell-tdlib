module TD.Query.SetChatActiveStoriesList(SetChatActiveStoriesList(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryList as StoryList

data SetChatActiveStoriesList -- ^ Changes story list in which stories from the chat are shown
  = SetChatActiveStoriesList
    { chat_id    :: Maybe Int                 -- ^ Identifier of the chat that posted stories
    , story_list :: Maybe StoryList.StoryList -- ^ New list for active stories posted by the chat
    }
  deriving (Eq)

instance Show SetChatActiveStoriesList where
  show
    SetChatActiveStoriesList
      { chat_id    = chat_id_
      , story_list = story_list_
      }
        = "SetChatActiveStoriesList"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "story_list" `I.p` story_list_
          ]

instance AT.ToJSON SetChatActiveStoriesList where
  toJSON
    SetChatActiveStoriesList
      { chat_id    = chat_id_
      , story_list = story_list_
      }
        = A.object
          [ "@type"      A..= AT.String "setChatActiveStoriesList"
          , "chat_id"    A..= chat_id_
          , "story_list" A..= story_list_
          ]
