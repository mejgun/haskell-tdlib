module TD.Query.CanBoostChat
  (CanBoostChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Checks whether the current user can boost a chat. Returns 'TD.Data.CanBoostChatResult.CanBoostChatResult'
data CanBoostChat
  = CanBoostChat
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow CanBoostChat where
  shortShow
    CanBoostChat
      { chat_id = chat_id_
      }
        = "CanBoostChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON CanBoostChat where
  toJSON
    CanBoostChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "canBoostChat"
          , "chat_id" A..= chat_id_
          ]

