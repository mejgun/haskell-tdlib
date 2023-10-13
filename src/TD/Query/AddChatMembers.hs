module TD.Query.AddChatMembers(AddChatMembers(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AddChatMembers -- ^ Adds multiple new members to a chat. Currently, this method is only available for supergroups and channels. This method can't be used to join a chat. Members can't be added to a channel if it has more than 200 members
  = AddChatMembers
    { chat_id  :: Maybe Int   -- ^ Chat identifier
    , user_ids :: Maybe [Int] -- ^ Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels
    }
  deriving (Eq)

instance Show AddChatMembers where
  show
    AddChatMembers
      { chat_id  = chat_id_
      , user_ids = user_ids_
      }
        = "AddChatMembers"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "user_ids" `I.p` user_ids_
          ]

instance AT.ToJSON AddChatMembers where
  toJSON
    AddChatMembers
      { chat_id  = chat_id_
      , user_ids = user_ids_
      }
        = A.object
          [ "@type"    A..= AT.String "addChatMembers"
          , "chat_id"  A..= chat_id_
          , "user_ids" A..= user_ids_
          ]
