module TD.Query.BoostChat
  (BoostChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Boosts a chat
data BoostChat
  = BoostChat
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow BoostChat where
  shortShow
    BoostChat
      { chat_id = chat_id_
      }
        = "BoostChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON BoostChat where
  toJSON
    BoostChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "boostChat"
          , "chat_id" A..= chat_id_
          ]

