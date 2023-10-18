module TD.Query.CanBotSendMessages
  (CanBotSendMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Checks whether the specified bot can send messages to the user. Returns a 404 error if can't and the access can be granted by call to allowBotToSendMessages. Returns 'TD.Data.Ok.Ok'
data CanBotSendMessages
  = CanBotSendMessages
    { bot_user_id :: Maybe Int -- ^ Identifier of the target bot
    }
  deriving (Eq, Show)

instance I.ShortShow CanBotSendMessages where
  shortShow
    CanBotSendMessages
      { bot_user_id = bot_user_id_
      }
        = "CanBotSendMessages"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON CanBotSendMessages where
  toJSON
    CanBotSendMessages
      { bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "canBotSendMessages"
          , "bot_user_id" A..= bot_user_id_
          ]

