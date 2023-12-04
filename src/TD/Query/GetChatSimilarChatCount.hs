module TD.Query.GetChatSimilarChatCount
  (GetChatSimilarChatCount(..)
  , defaultGetChatSimilarChatCount
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns approximate number of chats similar to the given chat. Returns 'TD.Data.Count.Count'
data GetChatSimilarChatCount
  = GetChatSimilarChatCount
    { chat_id      :: Maybe Int  -- ^ Identifier of the target chat; must be an identifier of a channel chat
    , return_local :: Maybe Bool -- ^ Pass true to get the number of chats without sending network requests, or -1 if the number of chats is unknown locally
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatSimilarChatCount where
  shortShow
    GetChatSimilarChatCount
      { chat_id      = chat_id_
      , return_local = return_local_
      }
        = "GetChatSimilarChatCount"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "return_local" `I.p` return_local_
          ]

instance AT.ToJSON GetChatSimilarChatCount where
  toJSON
    GetChatSimilarChatCount
      { chat_id      = chat_id_
      , return_local = return_local_
      }
        = A.object
          [ "@type"        A..= AT.String "getChatSimilarChatCount"
          , "chat_id"      A..= chat_id_
          , "return_local" A..= return_local_
          ]

defaultGetChatSimilarChatCount :: GetChatSimilarChatCount
defaultGetChatSimilarChatCount =
  GetChatSimilarChatCount
    { chat_id      = Nothing
    , return_local = Nothing
    }

