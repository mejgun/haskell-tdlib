module TD.Query.ConnectChatAffiliateProgram
  (ConnectChatAffiliateProgram(..)
  , defaultConnectChatAffiliateProgram
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Connects an affiliate program to the given chat. Returns information about the connected affiliate program. Returns 'TD.Data.ChatAffiliateProgram.ChatAffiliateProgram'
data ConnectChatAffiliateProgram
  = ConnectChatAffiliateProgram
    { chat_id     :: Maybe Int -- ^ Identifier of the chat to which the affiliate program will be connected. Can be an identifier of the Saved Messages chat, of a chat with an owned bot, or of a channel chat with can_post_messages administrator right
    , bot_user_id :: Maybe Int -- ^ Identifier of the bot, which affiliate program is connected
    }
  deriving (Eq, Show)

instance I.ShortShow ConnectChatAffiliateProgram where
  shortShow
    ConnectChatAffiliateProgram
      { chat_id     = chat_id_
      , bot_user_id = bot_user_id_
      }
        = "ConnectChatAffiliateProgram"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON ConnectChatAffiliateProgram where
  toJSON
    ConnectChatAffiliateProgram
      { chat_id     = chat_id_
      , bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "connectChatAffiliateProgram"
          , "chat_id"     A..= chat_id_
          , "bot_user_id" A..= bot_user_id_
          ]

defaultConnectChatAffiliateProgram :: ConnectChatAffiliateProgram
defaultConnectChatAffiliateProgram =
  ConnectChatAffiliateProgram
    { chat_id     = Nothing
    , bot_user_id = Nothing
    }

