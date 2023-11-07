module TD.Query.BoostChat
  (BoostChat(..)
  , defaultBoostChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Boosts a chat and returns the list of available chat boost slots for the current user after the boost. Returns 'TD.Data.ChatBoostSlots.ChatBoostSlots'
data BoostChat
  = BoostChat
    { chat_id  :: Maybe Int   -- ^ Identifier of the chat
    , slot_ids :: Maybe [Int] -- ^ Identifiers of boost slots of the current user from which to apply boosts to the chat
    }
  deriving (Eq, Show)

instance I.ShortShow BoostChat where
  shortShow
    BoostChat
      { chat_id  = chat_id_
      , slot_ids = slot_ids_
      }
        = "BoostChat"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "slot_ids" `I.p` slot_ids_
          ]

instance AT.ToJSON BoostChat where
  toJSON
    BoostChat
      { chat_id  = chat_id_
      , slot_ids = slot_ids_
      }
        = A.object
          [ "@type"    A..= AT.String "boostChat"
          , "chat_id"  A..= chat_id_
          , "slot_ids" A..= slot_ids_
          ]

defaultBoostChat :: BoostChat
defaultBoostChat =
  BoostChat
    { chat_id  = Nothing
    , slot_ids = Nothing
    }

