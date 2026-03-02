module TD.Query.SetChatMemberTag
  (SetChatMemberTag(..)
  , defaultSetChatMemberTag
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the tag or custom title of a chat member; requires can_manage_tags administrator right to change tag of other users; for basic groups and supergroups only. Returns 'TD.Data.Ok.Ok'
data SetChatMemberTag
  = SetChatMemberTag
    { chat_id :: Maybe Int    -- ^ Chat identifier
    , user_id :: Maybe Int    -- ^ Identifier of the user, which tag is changed. Chats can't have member tags
    , tag     :: Maybe T.Text -- ^ The new tag of the member in the chat; 0-16 characters without emoji
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatMemberTag where
  shortShow
    SetChatMemberTag
      { chat_id = chat_id_
      , user_id = user_id_
      , tag     = tag_
      }
        = "SetChatMemberTag"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "user_id" `I.p` user_id_
          , "tag"     `I.p` tag_
          ]

instance AT.ToJSON SetChatMemberTag where
  toJSON
    SetChatMemberTag
      { chat_id = chat_id_
      , user_id = user_id_
      , tag     = tag_
      }
        = A.object
          [ "@type"   A..= AT.String "setChatMemberTag"
          , "chat_id" A..= chat_id_
          , "user_id" A..= user_id_
          , "tag"     A..= tag_
          ]

defaultSetChatMemberTag :: SetChatMemberTag
defaultSetChatMemberTag =
  SetChatMemberTag
    { chat_id = Nothing
    , user_id = Nothing
    , tag     = Nothing
    }

