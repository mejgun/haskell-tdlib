module TD.Query.SetChatDescription
  (SetChatDescription(..)
  , defaultSetChatDescription
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes information about a chat. Available for basic groups, supergroups, and channels. Requires can_change_info member right. Returns 'TD.Data.Ok.Ok'
data SetChatDescription
  = SetChatDescription
    { chat_id     :: Maybe Int    -- ^ Identifier of the chat
    , description :: Maybe T.Text -- ^ New chat description; 0-255 characters
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatDescription where
  shortShow
    SetChatDescription
      { chat_id     = chat_id_
      , description = description_
      }
        = "SetChatDescription"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "description" `I.p` description_
          ]

instance AT.ToJSON SetChatDescription where
  toJSON
    SetChatDescription
      { chat_id     = chat_id_
      , description = description_
      }
        = A.object
          [ "@type"       A..= AT.String "setChatDescription"
          , "chat_id"     A..= chat_id_
          , "description" A..= description_
          ]

defaultSetChatDescription :: SetChatDescription
defaultSetChatDescription =
  SetChatDescription
    { chat_id     = Nothing
    , description = Nothing
    }

