module TD.Query.CanSendStory
  (CanSendStory(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Checks whether the current user can send a story on behalf of a chat; requires can_post_stories rights for channel chats
data CanSendStory
  = CanSendStory
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow CanSendStory where
  shortShow
    CanSendStory
      { chat_id = chat_id_
      }
        = "CanSendStory"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON CanSendStory where
  toJSON
    CanSendStory
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "canSendStory"
          , "chat_id" A..= chat_id_
          ]

