module TD.Query.GetVideoChatAvailableParticipants
  (GetVideoChatAvailableParticipants(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetVideoChatAvailableParticipants -- ^ Returns list of participant identifiers, on whose behalf a video chat in the chat can be joined
  = GetVideoChatAvailableParticipants
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show GetVideoChatAvailableParticipants where
  show
    GetVideoChatAvailableParticipants
      { chat_id = chat_id_
      }
        = "GetVideoChatAvailableParticipants"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetVideoChatAvailableParticipants where
  toJSON
    GetVideoChatAvailableParticipants
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getVideoChatAvailableParticipants"
          , "chat_id" A..= chat_id_
          ]

