module TD.Query.GetChatAffiliateProgram
  (GetChatAffiliateProgram(..)
  , defaultGetChatAffiliateProgram
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an affiliate program that were connected to the given chat by identifier of the bot that created the program. Returns 'TD.Data.ChatAffiliateProgram.ChatAffiliateProgram'
data GetChatAffiliateProgram
  = GetChatAffiliateProgram
    { chat_id     :: Maybe Int -- ^ Identifier of the chat for which the affiliate program was connected. Can be an identifier of the Saved Messages chat, of a chat with an owned bot, or of a channel chat with can_post_messages administrator right
    , bot_user_id :: Maybe Int -- ^ Identifier of the bot that created the program
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatAffiliateProgram where
  shortShow
    GetChatAffiliateProgram
      { chat_id     = chat_id_
      , bot_user_id = bot_user_id_
      }
        = "GetChatAffiliateProgram"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON GetChatAffiliateProgram where
  toJSON
    GetChatAffiliateProgram
      { chat_id     = chat_id_
      , bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "getChatAffiliateProgram"
          , "chat_id"     A..= chat_id_
          , "bot_user_id" A..= bot_user_id_
          ]

defaultGetChatAffiliateProgram :: GetChatAffiliateProgram
defaultGetChatAffiliateProgram =
  GetChatAffiliateProgram
    { chat_id     = Nothing
    , bot_user_id = Nothing
    }

