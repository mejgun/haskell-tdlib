module TD.Query.AddChatMembers
  (AddChatMembers(..)
  , defaultAddChatMembers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Adds multiple new members to a chat; requires can_invite_users member right. Currently, this method is only available for supergroups and channels. This method can't be used to join a chat. Members can't be added to a channel if it has more than 200 members. Returns information about members that weren't added. Returns 'TD.Data.FailedToAddMembers.FailedToAddMembers'
data AddChatMembers
  = AddChatMembers
    { chat_id  :: Maybe Int   -- ^ Chat identifier
    , user_ids :: Maybe [Int] -- ^ Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels
    }
  deriving (Eq, Show)

instance I.ShortShow AddChatMembers where
  shortShow
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

defaultAddChatMembers :: AddChatMembers
defaultAddChatMembers =
  AddChatMembers
    { chat_id  = Nothing
    , user_ids = Nothing
    }

