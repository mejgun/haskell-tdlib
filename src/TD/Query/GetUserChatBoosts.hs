module TD.Query.GetUserChatBoosts
  (GetUserChatBoosts(..)
  , defaultGetUserChatBoosts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of boosts applied to a chat by a given user; requires administrator rights in the chat; for bots only. Returns 'TD.Data.FoundChatBoosts.FoundChatBoosts'
data GetUserChatBoosts
  = GetUserChatBoosts
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    , user_id :: Maybe Int -- ^ Identifier of the user
    }
  deriving (Eq, Show)

instance I.ShortShow GetUserChatBoosts where
  shortShow
    GetUserChatBoosts
      { chat_id = chat_id_
      , user_id = user_id_
      }
        = "GetUserChatBoosts"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "user_id" `I.p` user_id_
          ]

instance AT.ToJSON GetUserChatBoosts where
  toJSON
    GetUserChatBoosts
      { chat_id = chat_id_
      , user_id = user_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getUserChatBoosts"
          , "chat_id" A..= chat_id_
          , "user_id" A..= user_id_
          ]

defaultGetUserChatBoosts :: GetUserChatBoosts
defaultGetUserChatBoosts =
  GetUserChatBoosts
    { chat_id = Nothing
    , user_id = Nothing
    }

