module TD.Query.CloseChat
  (CloseChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that the chat is closed by the user. Many useful activities depend on the chat being opened or closed. Returns 'TD.Data.Ok.Ok'
data CloseChat
  = CloseChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow CloseChat where
  shortShow
    CloseChat
      { chat_id = chat_id_
      }
        = "CloseChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON CloseChat where
  toJSON
    CloseChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "closeChat"
          , "chat_id" A..= chat_id_
          ]

