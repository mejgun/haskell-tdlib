module TD.Query.AllowBotToSendMessages
  (AllowBotToSendMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Allows the specified bot to send messages to the user. Returns 'TD.Data.Ok.Ok'
data AllowBotToSendMessages
  = AllowBotToSendMessages
    { bot_user_id :: Maybe Int -- ^ Identifier of the target bot
    }
  deriving (Eq, Show)

instance I.ShortShow AllowBotToSendMessages where
  shortShow
    AllowBotToSendMessages
      { bot_user_id = bot_user_id_
      }
        = "AllowBotToSendMessages"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON AllowBotToSendMessages where
  toJSON
    AllowBotToSendMessages
      { bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "allowBotToSendMessages"
          , "bot_user_id" A..= bot_user_id_
          ]

