module TD.Query.GetGroupsInCommon where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetGroupsInCommon -- ^ Returns a list of common group chats with a given user. Chats are sorted by their type and creation date
  = GetGroupsInCommon
    { user_id        :: Maybe Int -- ^ User identifier
    , offset_chat_id :: Maybe Int -- ^ Chat identifier starting from which to return chats; use 0 for the first request
    , limit          :: Maybe Int -- ^ The maximum number of chats to be returned; up to 100
    }
  deriving (Eq)

instance Show GetGroupsInCommon where
  show
    GetGroupsInCommon
      { user_id        = user_id_
      , offset_chat_id = offset_chat_id_
      , limit          = limit_
      }
        = "GetGroupsInCommon"
          ++ I.cc
          [ "user_id"        `I.p` user_id_
          , "offset_chat_id" `I.p` offset_chat_id_
          , "limit"          `I.p` limit_
          ]

instance AT.ToJSON GetGroupsInCommon where
  toJSON
    GetGroupsInCommon
      { user_id        = user_id_
      , offset_chat_id = offset_chat_id_
      , limit          = limit_
      }
        = A.object
          [ "@type"          A..= AT.String "getGroupsInCommon"
          , "user_id"        A..= user_id_
          , "offset_chat_id" A..= offset_chat_id_
          , "limit"          A..= limit_
          ]
