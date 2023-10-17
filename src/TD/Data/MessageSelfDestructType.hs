module TD.Data.MessageSelfDestructType
  (MessageSelfDestructType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes when a message will be self-destructed
data MessageSelfDestructType
  = MessageSelfDestructTypeTimer -- ^ The message will be self-destructed in the specified time after its content was opened
    { self_destruct_time :: Maybe Int -- ^ The message's self-destruct time, in seconds; must be between 0 and 60 in private chats
    }
  | MessageSelfDestructTypeImmediately -- ^ The message can be opened only once and will be self-destructed once closed
  deriving (Eq, Show)

instance I.ShortShow MessageSelfDestructType where
  shortShow MessageSelfDestructTypeTimer
    { self_destruct_time = self_destruct_time_
    }
      = "MessageSelfDestructTypeTimer"
        ++ I.cc
        [ "self_destruct_time" `I.p` self_destruct_time_
        ]
  shortShow MessageSelfDestructTypeImmediately
      = "MessageSelfDestructTypeImmediately"

instance AT.FromJSON MessageSelfDestructType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSelfDestructTypeTimer"       -> parseMessageSelfDestructTypeTimer v
      "messageSelfDestructTypeImmediately" -> pure MessageSelfDestructTypeImmediately
      _                                    -> mempty
    
    where
      parseMessageSelfDestructTypeTimer :: A.Value -> AT.Parser MessageSelfDestructType
      parseMessageSelfDestructTypeTimer = A.withObject "MessageSelfDestructTypeTimer" $ \o -> do
        self_destruct_time_ <- o A..:?  "self_destruct_time"
        pure $ MessageSelfDestructTypeTimer
          { self_destruct_time = self_destruct_time_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageSelfDestructType where
  toJSON MessageSelfDestructTypeTimer
    { self_destruct_time = self_destruct_time_
    }
      = A.object
        [ "@type"              A..= AT.String "messageSelfDestructTypeTimer"
        , "self_destruct_time" A..= self_destruct_time_
        ]
  toJSON MessageSelfDestructTypeImmediately
      = A.object
        [ "@type" A..= AT.String "messageSelfDestructTypeImmediately"
        ]

