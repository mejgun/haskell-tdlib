module TD.Data.ChatBoostSlots
  (ChatBoostSlots(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatBoostSlot as ChatBoostSlot

data ChatBoostSlots
  = ChatBoostSlots -- ^ Contains a list of chat boost slots
    { slots :: Maybe [ChatBoostSlot.ChatBoostSlot] -- ^ List of boost slots
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoostSlots where
  shortShow ChatBoostSlots
    { slots = slots_
    }
      = "ChatBoostSlots"
        ++ I.cc
        [ "slots" `I.p` slots_
        ]

instance AT.FromJSON ChatBoostSlots where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoostSlots" -> parseChatBoostSlots v
      _                -> mempty
    
    where
      parseChatBoostSlots :: A.Value -> AT.Parser ChatBoostSlots
      parseChatBoostSlots = A.withObject "ChatBoostSlots" $ \o -> do
        slots_ <- o A..:?  "slots"
        pure $ ChatBoostSlots
          { slots = slots_
          }
  parseJSON _ = mempty

