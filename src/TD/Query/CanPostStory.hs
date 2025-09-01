module TD.Query.CanPostStory
  (CanPostStory(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Checks whether the current user can post a story on behalf of a chat; requires can_post_stories administrator right for supergroup and channel chats. Returns 'TD.Data.CanPostStoryResult.CanPostStoryResult'
data CanPostStory
  = CanPostStory
    { chat_id :: Maybe Int -- ^ Chat identifier. Pass Saved Messages chat identifier when posting a story on behalf of the current user
    }
  deriving (Eq, Show)

instance I.ShortShow CanPostStory where
  shortShow
    CanPostStory
      { chat_id = chat_id_
      }
        = "CanPostStory"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON CanPostStory where
  toJSON
    CanPostStory
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "canPostStory"
          , "chat_id" A..= chat_id_
          ]

